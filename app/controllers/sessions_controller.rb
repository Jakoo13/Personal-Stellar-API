class SessionsController < Devise::SessionsController
    respond_to :json
    
    private
    
    def respond_with(resource, _opts = {})
        render json: resource, :except =>  [:created_at, :updated_at]
    end
    
    def respond_to_on_destroy
        # head :no_content
        render json: {"message": "Logout Success"}
    end
end