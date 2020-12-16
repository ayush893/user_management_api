#class Api::V1::UsersController < ApplicationController
#end

module Api
	module V1

		class UsersController < ApplicationController

			def index
				user= User.all
  				render json: { status: "success", message: "You are registered successfully", data: user}, status: :ok


			end
			def show
				user = User.find(params[:id])
				render json: { status: "success", message: "You are already successfully", data: user}, status: :ok
  			end

			def create
		  	#render plain: params[:user].inspect 
			  	user = User.new(user_params)
			  	if user.save
			  	#redirec_to @user
			  		render json: { status: "success", message: "You are registered successfully", data: user}, status: :ok
			  	else
			  		render render json: { status: "ERROR", message: "registered failed", data: user.errors}, status: :unprocessable_entity

			  	end
			  end

			  def update
  				user = User.find(params[:id])
  				if user.update(user_params)
  					render json: { status: "success", message: "User details are updated successfully", data: user}, status: :ok
  				else
  					ender json: { status: "ERROR", message: "updation got failed", data: user.errors}, status: :unprocessable_entity
  				end
  			end

			private def user_params
  				params.permit(:username, :email,:password)
  			end

  			def destroy
  				user = User.find(params[:id])
  				user.destroy
  				render json: { status: "success", message: "user deleted", data: user}, status: :ok
  			end

  			


  		



		end
	end

end

