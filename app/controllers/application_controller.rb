class ApplicationController < ActionController::API
    # before_action :authorized
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    
    def encode_token(payload)
        # should store secret in env variable
        JWT.encode(payload, 'my_s3cr3t')
      end
    
      def auth_header
        # { Authorization: 'Bearer <token>' }
        request.headers['Authorization']
      end
    
      def decoded_token
        if auth_header
          token = auth_header.split(' ')[1]
          # header: { 'Authorization': 'Bearer <token>' }
          begin
            JWT.decode(token, 'my_s3cr3t', true, algorithm: 'HS256')
          rescue JWT::DecodeError
            nil
          end
        end
      end
    
      def current_user
        if decoded_token
          user_id = decoded_token[0]['user_id']
          @user = User.find_by(id: user_id)
        end
      end
    
      def logged_in?
        !!current_user
      end
    
    #   def authorized
    #     render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    #   end
    
    private
  
    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
  
    def render_not_found_response(invalid)
        render json: { errors: invalid }, status: :not_found
    end
end
