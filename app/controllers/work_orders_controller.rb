class WorkOrdersController < ApplicationController
  before_action :authenticate_user!
  # , :set_work_order, only: %i[ show update destroy ]

  # GET /work_orders
  def index
    @work_orders = WorkOrder.all

    render json: @work_orders
  end

  # GET /work_orders/1
  def show
    render json: @work_order
  end

  # POST /work_orders
  def create
    @work_order = WorkOrder.new(work_order_params)

    if @work_order.save
      render json: @work_order, status: :created, location: @work_order,  :except =>  [:created_at, :updated_at]
    else
      render json: @work_order.errors, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /work_orders/1
  def update
    if @work_order.update(work_order_params)
      render json: @work_order
    else
      render json: @work_order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /work_orders/1
  def destroy
    @work_order.destroy
  end

  # PUT /work-orders/:id/:acceptOrDecline
  def accept_or_decline
    @work_order = WorkOrder.find(params[:id])
    if params[:acceptOrDecline] == "accept"
      @work_order.update_attribute(:stage, "accepted")
      render json: @work_order
    elsif params[:acceptOrDecline] == "decline"
      @work_order.update_attribute(:stage, "unassigned")
      @work_order.update_attribute(:user_id, 0)
      render json: @work_order
    end
  end

  # PUT /work-orders/:id/assign/:user_id
  def assign
    @work_order = WorkOrder.find(params[:id])
    @work_order.update_attribute(:user_id, params[:user_id])
    @work_order.update_attribute(:stage, "accept/decline")
    render json: @work_order
  end

  # PUT /work-orders/:id/en-route
  def en_route
    @work_order = WorkOrder.find(params[:id])
    @work_order.update_attribute(:stage, "en-route")
    render json: @work_order
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work_order
      @work_order = WorkOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def work_order_params
      params.require(:work_order).permit(:title, :content, :work_type, :address, :appointment_time, :user_id, :stage)
    end
end
