# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string           not null
#  created_at :datetime
#  updated_at :datetime
#  premium    :boolean          default(FALSE)
#

class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true

  has_many :submitted_urls,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :ShortenedUrl

  has_many :visits,
      foreign_key: :user_id,
      primary_key: :id,
      class_name: :Visit

  has_many :visited_urls,
    -> { distinct },
    through: :visits,
    source: :url

  def num_recent_created_urls(date)
    self.submitted_urls.where(["shortened_urls.created_at > ?", date]).count
  end

  def num_created_urls
    self.submitted_urls.count
  end

  def visit!(url)
    Visit.record_visit!(self, url)
  end
end
