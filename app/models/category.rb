class Category < ApplicationRecord
	has_many :question_categoryships , :dependent => :destroy
    has_many :questions, :through => :question_categoryships , :dependent => :destroy
end
