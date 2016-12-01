class Api::UsersController < Api::BaseController
	#GET /api/users.json
	def index
			@users = User.all
			response.headers['Content-Type_example_test'] = 'hidden secret'
		# render json: { user: @users} 
	end	
	#GET /api/users/1.json
	def show
		headers['Access-Control-Allow-Origin'] = '*'
		@user = User.find(params[:id])
		# render json: { user: @user }
	end

	#POST /api/users.json
	def create
		@user =User.new(params.require( :user ).permit( :email, :password ))
		if @user.save
			render json: { user: @user }
		else
			render json: { errors: @user.errors.full_messages }, status: 400
		end		
	end	

	def update
		render json: { user: @user }
	end	
end
