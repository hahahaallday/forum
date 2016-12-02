class AddCreateLike < ActiveRecord::Migration[5.0]
  def change
  	rename_column :likes ,:event_id, :question_id
  end
end
