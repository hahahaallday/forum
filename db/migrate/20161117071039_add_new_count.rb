class AddNewCount < ActiveRecord::Migration[5.0]
  def change
  	add_column :questions, :answers_countNumber, :integer
  end
end
