class AddIdToQuestions < ActiveRecord::Migration[5.0]
  def change
  	remove_column :categories, :category_id, :integer
  	add_column :questions, :category_id, :integer
  end
end
