module Api
    module V1
        class AuthController < ApplicationController
            def login
                @user = User.find_by(email: params[:email])  # Finds user by email
                if @user && @user.authenticate(params[:password])  # Verifies password
                    token = encode_token({ user_id: @user.id })     # Creates new token
                    render json: { user: @user, token: token }
                else
                render json: { error: "Invalid email or password" }, 
                    status: :unauthorized
                end
            end

            def auto_login
                if current_user    # Uses current_user method from ApplicationController
                    render json: current_user
                else
                    render json: { errors: "No user logged in" }
                end
            end
        end
    end
end