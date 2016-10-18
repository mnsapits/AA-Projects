class Person < ActiveRecord::Base
  validates :name, :house_id, presence: true
end
