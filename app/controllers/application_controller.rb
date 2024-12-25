class ApplicationController < ActionController::API
    def jwt_key
        Rails.application.credentials.jwt_key  # Gets the secret key from credentials
    end

    def encode_token(payload)
        JWT.encode(payload, jwt_key)  # Creates a JWT token with the payload
    end

    def auth_header
        request.headers['Authorization']  # Gets the Authorization header from requests
    end

    def decoded_token
        if auth_header
        token = auth_header.split(' ')[1]  # Extracts token from "Bearer <token>"
        begin
            JWT.decode(token, jwt_key, true, algorithm: 'HS256')  # Decodes and verifies token
        rescue JWT::DecodeError
            nil  # Returns nil if token is invalid
        end
        end
    end

    def current_user
        if decoded_token
        user_id = decoded_token[0]['user_id']  # Gets user_id from decoded token
        @user = User.find_by(id: user_id)     # Finds the user
        end
    end

    def logged_in?
        !!current_user  # Converts current_user to boolean
    end

    def authorize
        render json: { message: 'Please log in' }, 
        status: :unauthorized unless logged_in?  # Requires login for protected routes
    end
end