# == Schema Information
#
# Table name: shortened_urls
#
#  id         :integer          not null, primary key
#  short_url  :string           not null
#  long_url   :string           not null
#  user_id    :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class ShortenedUrl < ActiveRecord::Base
  validates :short_url, :long_url, presence: true, uniqueness: true
  validates :user_id, presence: true

  validate :url_length

  def url_length
    if self.long_url.length > 1024
      self.errors["Url"] = "too long"
    end
  end

  validate :max_submits_in_one_minute

  def max_submits_in_one_minute
    if self.submitter.num_recent_created_urls(1.minutes.ago) >= 5
      self.errors["Submitted"] = "too many urls in last minute"
    end
  end

  validate :max_submits

  def max_submits
    if self.submitter.num_created_urls >= 5 && !self.submitter.premium
      self.errors["Max"] = "number of urls submits reached"
    end
  end



  belongs_to :submitter,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User

  has_many :taggings,
    foreign_key: :url_id,
    primary_key: :id,
    class_name: :Tagging

  has_many :visits,
    foreign_key: :url_id,
    primary_key: :id,
    class_name: :Visit

  has_many :visitors,
    -> { distinct },
    through: :visits,
    source: :user

  has_many :tags,
    -> { distinct },
    through: :taggings,
    source: :tag

  def self.random_code
    random_url = SecureRandom.urlsafe_base64
    while ShortenedUrl.exists?(short_url: random_url)
      random_url = SecureRandom.urlsafe_base64
    end
    random_url
  end

  def self.create_for_user_and_long_url!(user, long_url, short_url = nil)
    short_url ||= self.random_code
    ShortenedUrl.create(user_id: user.id, long_url: long_url, short_url: short_url)
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visitors.count
  end

  def num_recent_uniques(date)
    self.visitors.where(["users.created_at > ?", date]).count
  end

  def tag_url(tag)
    Tagging.create(url_id: self.id, tag_id: tag.id)
  end

  def self.prune(n)
    ShortenedUrl.all.each do |url|
      last_visit = url.last_visited || url.created_at
      url.destroy if last_visit < n.minutes.ago && !url.submitter.premium
    end
    ShortenedUrl.all.count
  end

  def last_visited
    last_visit = self.visits.last
    return nil if last_visit.nil?
    last_visit.created_at
  end
end
