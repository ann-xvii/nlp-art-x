class UsersController < ApplicationController
# skip_before_action :require_login, only: [:index, :new, :create]
# skip_before_action :correct_user, only: [:index, :show, :new, :create, :add_activity]
# skip_before_action :admin
		def index 
			@users = User.all
		end

		def show
			@user = User.find(params[:id])
		end

		def new
			@user = User.new
		end

		def create
			@user = User.new(user_params)
			if @user.save
				session[:user_id] = @user.id.to_s
				redirect_to posts_path
			else
				render :new
			end
		end

		def edit
			@user = User.find(params[:id])
			# @activity = Activity.find(params[:user][:activity_ids][:id])
		end

		def update
			@user = User.find(params[:id])
			# binding.pry
			# if params[:user][:activity_ids][:id]
			# 	@activity = Activity.find(params[:user][:activity_ids][:id])
			# 	@user.activities.push(@activity)
			# end
			if @user.update_attributes(user_params)
				redirect_to activities_path
			else
				render "edit"
			end
		end

		def add_activity
			@user = User.find(params[:user][:id])
			# binding.pry
			@activity = Activity.find(params[:user][:activity_ids][:id])
			@user.activities.push(@activity)
			redirect_to activities_path
		end

		def destroy
			@user = User.find(params[:id])
			if @user.destroy
				unless @user = current_user.admin
					session.delete(:user_id)
					redirect_to posts_path
				else
					redirect_to posts_path
				end
			end
		end

		private
		def  user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation, :posts_ids => [])
			
		end

end