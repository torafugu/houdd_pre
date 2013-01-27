require 'test_helper'

class MoresmalltrialsControllerTest < ActionController::TestCase
  setup do
    @moresmalltrial = moresmalltrials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:moresmalltrials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create moresmalltrial" do
    assert_difference('Moresmalltrial.count') do
      post :create, moresmalltrial: @moresmalltrial.attributes
    end

    assert_redirected_to moresmalltrial_path(assigns(:moresmalltrial))
  end

  test "should show moresmalltrial" do
    get :show, id: @moresmalltrial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @moresmalltrial
    assert_response :success
  end

  test "should update moresmalltrial" do
    put :update, id: @moresmalltrial, moresmalltrial: @moresmalltrial.attributes
    assert_redirected_to moresmalltrial_path(assigns(:moresmalltrial))
  end

  test "should destroy moresmalltrial" do
    assert_difference('Moresmalltrial.count', -1) do
      delete :destroy, id: @moresmalltrial
    end

    assert_redirected_to moresmalltrials_path
  end
end
