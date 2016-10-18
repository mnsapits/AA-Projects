# == Schema Information
#
# Table name: taggings
#
#  id         :integer          not null, primary key
#  url_id     :integer          not null
#  tag_id     :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Tagging < ActiveRecord::Base
  validates :url_id, :tag_id, presence: true

  belongs_to :tag,
    foreign_key: :tag_id,
    primary_key: :id,
    class_name: :TagTopic

  belongs_to :url,
    foreign_key: :url_id,
    primary_key: :id,
    class_name: :ShortenedUrl
end
