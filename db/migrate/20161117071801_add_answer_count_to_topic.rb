class AddAnswerCountToTopic < ActiveRecord::Migration[5.0]
  def change
  	add_column :questions, :answers_count, :integer, :default => 0

  	 Question.pluck(:id).each do |i|
     Question.reset_counters(i, :answers) # 全部重算一次
    end
  end
end
