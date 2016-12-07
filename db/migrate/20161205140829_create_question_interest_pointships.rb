class CreateQuestionInterestPointships < ActiveRecord::Migration[5.0]
  def change
    create_table :question_interest_pointships do |t|
    	t.integer :question_id
      t.integer :interest_point_id
      t.timestamps
    end
  end
end
