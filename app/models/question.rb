class Question < ApplicationRecord
	validates_presence_of :topic
	# validates_presence_of :type
	has_many :categories
end
