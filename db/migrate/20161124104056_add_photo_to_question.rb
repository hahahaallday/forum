class AddPhotoToQuestion < ActiveRecord::Migration[5.0]
  def change
  	add_attachment :questions, :photo
  	add_attachment :answers, :photo
  end
end
