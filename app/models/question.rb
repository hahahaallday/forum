class Question < ApplicationRecord
	delegate :kind, :to => :category, :prefix => true, :allow_nil =>true
	validates_presence_of :topic
	# validates_presence_of :type
	belongs_to :category
	belongs_to :user
	has_many :answers
end
