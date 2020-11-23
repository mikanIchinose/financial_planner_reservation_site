require 'test_helper'

class FinancialPlannersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @financial_planner = financial_planners(:one)
  end

  test "should get index" do
    get financial_planners_url
    assert_response :success
  end

  test "should get new" do
    get new_financial_planner_url
    assert_response :success
  end

  test "should create financial_planner" do
    assert_difference('FinancialPlanner.count') do
      post financial_planners_url, params: { financial_planner: { email: @financial_planner.email, name: @financial_planner.name, phone_number: @financial_planner.phone_number } }
    end

    assert_redirected_to financial_planner_url(FinancialPlanner.last)
  end

  test "should show financial_planner" do
    get financial_planner_url(@financial_planner)
    assert_response :success
  end

  test "should get edit" do
    get edit_financial_planner_url(@financial_planner)
    assert_response :success
  end

  test "should update financial_planner" do
    patch financial_planner_url(@financial_planner), params: { financial_planner: { email: @financial_planner.email, name: @financial_planner.name, phone_number: @financial_planner.phone_number } }
    assert_redirected_to financial_planner_url(@financial_planner)
  end

  test "should destroy financial_planner" do
    assert_difference('FinancialPlanner.count', -1) do
      delete financial_planner_url(@financial_planner)
    end

    assert_redirected_to financial_planners_url
  end
end
