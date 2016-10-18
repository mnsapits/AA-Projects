# == Schema Information
#
# Table name: tag_topics
#
#  id         :integer          not null, primary key
#  topic      :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class TagTopic < ActiveRecord::Base
  validates :topic, presence: true, uniqueness: true

  has_many :taggings,
    foreign_key: :tag_id,
    primary_key: :id,
    class_name: :Tagging

  has_many :urls,
    -> { distinct },
    through: :taggings,
    source: :url

  def tag_url(url)
    Tagging.create(url_id: url.id, tag_id: self.id)
  end
end
