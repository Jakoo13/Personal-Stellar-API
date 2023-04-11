class UsersController < ApplicationController

    # before_action :authenticate_user!
    before_action :find_user, only: %i[show]

    def index
        users = User.all
        render json: users, :except =>  [:created_at, :updated_at]
    end

    def show
        render json: @user
    end

    # Gets Work Orders for the defined user ID
    # /users/:id/work-orders
    def work_orders
        @user = User.find(params[:id])
        @work_orders = @user.work_orders
        render json: @work_orders, :except =>  [:updated_at]
    end

    private

    def find_user
        @user = User.find(params[:id])
    end

   

end