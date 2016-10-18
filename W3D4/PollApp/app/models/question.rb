# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  poll_id    :integer          not null
#  text       :string           not null
#  created_at :datetime
#  updated_at :datetime
#

class Question < ActiveRecord::Base
  validates :poll_id, :text, presence: true

  belongs_to :poll,
    primary_key: :id,
    foreign_key: :poll_id,
    class_name: :Poll

  has_many :answers,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :Answer

  has_many :responses,
    through: :answers,
    source: :responses

  def results
    results_hash = {}
    answer_choices = self.answers
    answer_choices.each do |answer|
      results_hash[answer.text] = answer.responses.length
    end
    results_hash
  end

  def better_results
    # SELECT
    #   answers.text, COUNT(*)
    # FROM
    #   answers
    # LEFT OUTER JOIN
    #   responses
    #   ON
    #     answers.id = responses.answer_id
    # WHERE answers.question_id = 1
    # GROUP BY
    #   answers.text;
    results_hash = {}
    results = self.answers.select("answers.text,count(*)")
    .joins("LEFT OUTER JOIN responses ON answers.id = responses.answer_id")
    .where("answers.question_id = ?", self.id)
     .group("answers.text")
    results.each do |result|
      results_hash[result.text] = result.count
    end

    results_hash
  end

end
