class CreateInterestPoints < ActiveRecord::Migration[5.0]
  def change
    create_table :interest_points do |t|
    	t.string :content
    	t.integer :importance
    	t.integer  :priority
    	t.boolean  :urgency
      t.timestamps
    end
  end
end
