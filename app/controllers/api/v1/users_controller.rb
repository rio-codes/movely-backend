module Api
    module V1
        class UsersController < ApplicationController
            def create
                @user = User.create(user_params)  # Creates new user with permitted params
                if @user.valid?
                    token = encode_token({ user_id: @user.id })  # Generates token for new user
                    render json: { user: @user, token: token }, status: :created
                else
                    render json: { error: @user.errors.full_messages }, 
                    status: :unprocessable_entity
                end
            end

            private

            def user_params
                params.require(:user).permit(:email, :password, :password_confirmation)
                # Only allows these specific parameters
            end
        end
    end
end