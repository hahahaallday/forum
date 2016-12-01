class Admin::QuestionsController < ApplicationController
	before_action :authenticate_user!
	before_action :check_admin
    before_action :set_categories, :only =>[ :show, :edit, :update, :destroy ]
    layout "admin"

    def index
        @categories = Category.all
        @category = Category.new
    end

    def new 
        @category = Category.new
    end

    def create
        @categories = Category.all
        @category = Category.new(category_params)
        if @category.save
          flash[:notice] = "answer was successfully created"
          redirect_to admin_questions_path
        else
          render :action => :new
        end
    end 
    
    def edit        
        @categories = Category.all 
    end

    def update
        if @category.update(category_params)
            flash[:notice] = "Cateogry was successfully updated"
            redirect_to admin_questions_path
        else 
            render :edit 
        end     
    end 

    def destroy
        @category.destroy
        flash[:alert] = "Cateogry was successfully deleted"
        redirect_to admin_questions_path
    end 

    protected

    def category_params
        params.require( :category ).permit( :kind )
    end     

    def set_categories
        @category = Category.find(params[:id])
    end

    def check_admin
    	unless current_user.admin?
    		raise ActiveRecord::RecordNotFound
    	end	
    end
end
