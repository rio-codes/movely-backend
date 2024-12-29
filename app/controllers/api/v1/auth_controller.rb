module Api
    module V1
        class AuthController < ApplicationController
            def login
            user = User.find_by(email: params[:email])
            if user&.authenticate(params[:password])
                token = encode_token(user_id: user.id)
                render json: { token: token, user: user }
            else
                render json: { error: 'Invalid email or password' }, status: :unauthorized
            end
            end
    
            def auto_login
            if @current_user
                render json: @current_user
            else
                render json: { error: 'Not logged in' }, status: :unauthorized
            end
            end
        end
    end
end