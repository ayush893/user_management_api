class Api::V1::SessionsController < ApplicationController

		#def index
			#User.all .each |user|
			#f user.email == email and user.password==password
				#render json: { status: "success", message: "You are logged in", data: user}, status: :ok
			#else
				#render json: { status: "ERROR", message: "wrong details", data: user.errors}, status: :ok
			#end
		
	#end
		def create
			user=User.find_by(email: sign_in_params[:email])
			if user && user.authenticate(sign_in_params[:password])
				session[:user_id] = user.id
				render json: { status: "success", message: "You are logged in", data: user}, status: :ok
			else
				render json: {
					status: 401
				}
			end
		end
			#.try(:authenticate, params["password"])
			#if session[:user_id] = user_id
			#	render json:{
			#		status: :created,
			#		logged_in: true,
			#		user: user
			#	}
			#lse
			#	render json:{
			#		status:401
			#	}
			#end

		#end

		private def sign_in_params
			params.permit(:email,:password)
		end

		def destroy
			session[:user_id] = nil 
			render json: { status: "success", message: "You are logged out"}
		end
end
