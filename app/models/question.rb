class Question < ApplicationRecord
	validates_presence_of :topic
	# validates_presence_of :type
	belongs_to :user
	has_many :answers  , :dependent => :destroy
	has_many :question_categoryships , :dependent => :destroy
    has_many :categories, :through => :question_categoryships,  :dependent => :destroy

	has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/    
end
