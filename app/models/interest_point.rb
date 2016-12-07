class InterestPoint < ApplicationRecord
	has_many :question_interest_pointships
	has_many :questions, :through => :question_interest_pointships , :dependent => :destroy
end
