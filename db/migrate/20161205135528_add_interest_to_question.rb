class AddInterestToQuestion < ActiveRecord::Migration[5.0]
  def change
  	add_column :questions, :interest, :string
  end
end
