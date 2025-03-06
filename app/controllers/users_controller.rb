class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update, :destroy]
  
    def index
      @users = User.all
    end
  
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to users_path, notice: "User registered successfully!"
      else
        puts "DEBUG: Validation Errors - #{@user.errors.full_messages}"  
        flash.now[:alert] = "There were errors in your submission."
        render :new, status: :unprocessable_entity 
      end
    end
    
  
    def edit
    end
  
    def update
        if @user.update(user_params)
            redirect_to users_path, notice: "User updated successfully!"
          else
            flash.now[:alert] = "There were errors in your submission."
            render :edit, status: :unprocessable_entity  
          end
    end
  
    def destroy
      @user = User.find(params[:id]) 
      @user.destroy  
      redirect_to users_path, notice: "User deleted successfully!"
    end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:name, :email, :age, :password, :password_confirmation)
    end
  end
  
