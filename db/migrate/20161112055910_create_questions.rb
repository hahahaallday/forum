class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :topic
      t.text :description
      t.string :type
      t.string :point
      t.integer :importance
      t.integer :priority
      t.boolean :urgency

      t.timestamps
    end
  end
end
