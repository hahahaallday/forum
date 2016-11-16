class AddCountToQuestions < ActiveRecord::Migration[5.0]
  def change
  	add_column :questions, :count, :integer
  end
end
