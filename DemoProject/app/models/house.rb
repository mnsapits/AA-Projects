class House < ActiveRecord::Base
  validates: address, presence: true
end
