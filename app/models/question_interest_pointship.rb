class QuestionInterestPointship < ApplicationRecord
	belongs_to :question
	belongs_to :interest_point
end
