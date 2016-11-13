class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
    	t.string :kind
    	t.integer :question_id  	
      t.timestamps null: false
    end

    add_index :categories, :question_id
  end
end
