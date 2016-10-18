# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  answer_id  :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class Response < ActiveRecord::Base
  validates :user_id, :answer_id, presence: true
  validate :respondent_already_answered?
  validate :author_cant_respond_to_own_poll

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :answer,
    primary_key: :id,
    foreign_key: :answer_id,
    class_name: :Answer

  has_one :question,
    through: :answer,
    source: :question

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    if sibling_responses.exists?(user_id: self.user_id)
      errors[:duplicate] << "already responded to this question."
    end
  end

  def author_cant_respond_to_own_poll
    if self.answer.question.poll.author_id == self.user_id
      errors[:shady_author] << "Can't respond to own poll"
    end
  end

end
