require "test_helper"

class WorkOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @work_order = work_orders(:one)
  end

  test "should get index" do
    get work_orders_url, as: :json
    assert_response :success
  end

  test "should create work_order" do
    assert_difference("WorkOrder.count") do
      post work_orders_url, params: { work_order: { content: @work_order.content, title: @work_order.title } }, as: :json
    end

    assert_response :created
  end

  test "should show work_order" do
    get work_order_url(@work_order), as: :json
    assert_response :success
  end

  test "should update work_order" do
    patch work_order_url(@work_order), params: { work_order: { content: @work_order.content, title: @work_order.title } }, as: :json
    assert_response :success
  end

  test "should destroy work_order" do
    assert_difference("WorkOrder.count", -1) do
      delete work_order_url(@work_order), as: :json
    end

    assert_response :no_content
  end
end
