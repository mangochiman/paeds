require 'test_helper'

class DischargesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:discharges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create discharge" do
    assert_difference('Discharge.count') do
      post :create, :discharge => { }
    end

    assert_redirected_to discharge_path(assigns(:discharge))
  end

  test "should show discharge" do
    get :show, :id => discharges(:one).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => discharges(:one).id
    assert_response :success
  end

  test "should update discharge" do
    put :update, :id => discharges(:one).id, :discharge => { }
    assert_redirected_to discharge_path(assigns(:discharge))
  end

  test "should destroy discharge" do
    assert_difference('Discharge.count', -1) do
      delete :destroy, :id => discharges(:one).id
    end

    assert_redirected_to discharges_path
  end
end
