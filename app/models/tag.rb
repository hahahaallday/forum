class Tag < ApplicationRecord
	has_many :question_tagships
	has_many :questions, :through => :question_tagships , :dependent => :destroy
end
