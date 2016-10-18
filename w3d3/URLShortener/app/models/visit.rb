# == Schema Information
#
# Table name: visits
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  url_id     :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Visit < ActiveRecord::Base
  validates :user_id, :url_id, presence: true

  def self.record_visit!(user, shortened_url)
    self.create(user_id: user.id, url_id: shortened_url.id)
  end

  belongs_to :url,
    foreign_key: :url_id,
    primary_key: :id,
    class_name: :ShortenedUrl

  belongs_to :user,
    foreign_key: :user_id,
    primary_key: :id,
    class_name: :User
end
