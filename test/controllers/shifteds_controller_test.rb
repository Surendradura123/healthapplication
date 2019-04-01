require 'test_helper'

class ShiftedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shifted = shifteds(:one)
  end

  test "should get index" do
    get shifteds_url
    assert_response :success
  end

  test "should get new" do
    get new_shifted_url
    assert_response :success
  end

  test "should create shifted" do
    assert_difference('Shifted.count') do
      post shifteds_url, params: { shifted: { address: @shifted.address, cost: @shifted.cost, description: @shifted.description, dob: @shifted.dob, email: @shifted.email, firm: @shifted.firm, firstname: @shifted.firstname, lastname: @shifted.lastname, phone: @shifted.phone } }
    end

    assert_redirected_to shifted_url(Shifted.last)
  end

  test "should show shifted" do
    get shifted_url(@shifted)
    assert_response :success
  end

  test "should get edit" do
    get edit_shifted_url(@shifted)
    assert_response :success
  end

  test "should update shifted" do
    patch shifted_url(@shifted), params: { shifted: { address: @shifted.address, cost: @shifted.cost, description: @shifted.description, dob: @shifted.dob, email: @shifted.email, firm: @shifted.firm, firstname: @shifted.firstname, lastname: @shifted.lastname, phone: @shifted.phone } }
    assert_redirected_to shifted_url(@shifted)
  end

  test "should destroy shifted" do
    assert_difference('Shifted.count', -1) do
      delete shifted_url(@shifted)
    end

    assert_redirected_to shifteds_url
  end
end
