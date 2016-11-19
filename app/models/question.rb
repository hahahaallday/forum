class Question < ApplicationRecord
	validates_presence_of :topic
	# validates_presence_of :type
	belongs_to :user
	has_many :answers  , :dependent => :destroy
	has_many :question_categoryships , :dependent => :destroy
    has_many :categories, :through => :question_categoryships,  :dependent => :destroy
end
