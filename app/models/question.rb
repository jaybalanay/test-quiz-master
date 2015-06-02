class Question < ActiveRecord::Base

  validates_presence_of :question
  validates_presence_of :answer

  def is_correct?(submission)
    acceptable_format(self.answer) == acceptable_format(submission)
  end

  def acceptable_format(subs)
    subs.to_s.match(/\A[+-]?\d+\Z/) ? subs.to_i.to_words : subs.gsub(/\s+/,'').downcase.squish
  end

end
