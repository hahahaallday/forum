require 'rails_helper'

describe "Question" do
  

  it "save" do
 		@user = User.new(email: 'xxxxx@xxxxx', password:  '111111')
    expect(@user.save).to eq(true)
  end
  
  it "save1" do
  	@user = User.new(email: 'xxxxx@xxxxx', password:  '111111')
	  expect {
	  User.create(nickname: "Bar")
		}.to change { User.count }.by(1)
	end

	describe 'expect change.... to'	do

		before(:each) do
			@c = Category.new(name: 'hahahaallday')
		end

		it '.by' do
			expect {
				@c.save
			}.to change{Category.count}
		end

		it '.by' do
			expect{
				@c.save
			}.to change{Category.count}.to{1}
		end
	
	end		

end