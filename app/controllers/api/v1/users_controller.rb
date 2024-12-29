module Api
    module V1
        class UsersController < ApplicationController
            def create
            user = User.new(user_params)
            
            if User.exists?(email: user_params[:email])
                render json: { error: 'Email is already taken' }, status: :unprocessable_entity
            elsif user.save
                token = encode_token(user_id: user.id)
                render json: { token: token, user: user }, status: :created
            else
                render json: { error: user.errors.full_messages }, status: :unprocessable_entity
            end
            end
    
            private
    
            def user_params
            params.require(:user).permit(:email, :password)
            end
        end
    end
end