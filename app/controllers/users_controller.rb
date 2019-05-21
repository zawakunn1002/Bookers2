class UsersController < ApplicationController
	before_action :authenticate_user!
	def index
	      @users = User.all
		  @book = Book.new
		  @user = User.find(current_user.id)
	end

	def show
		  @user = User.find(params[:id])
		  @book = Book.new
		  @books =@user.books
	end

	def edit
		  @user = User.find(params[:id])
		  if current_user.id != @user.id
		  	redirect_to user_path(current_user.id)
		  end
	end

	def update
		  @user = User.find(params[:id])
		  if @user.update(user_params)
		  flash[:notice] = "You have updated book successfully"
		  redirect_to user_path
		  else
		  render 'edit'
		  end
	end

    private
    def user_params
    	params.require(:user).permit(:name, :introduction,:profile_image)
    end
end