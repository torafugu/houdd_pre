require 'test_helper'

class MostsmallmobgenesControllerTest < ActionController::TestCase
  setup do
    @mostsmallmobgene = mostsmallmobgenes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mostsmallmobgenes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mostsmallmobgene" do
    assert_difference('Mostsmallmobgene.count') do
      post :create, mostsmallmobgene: @mostsmallmobgene.attributes
    end

    assert_redirected_to mostsmallmobgene_path(assigns(:mostsmallmobgene))
  end

  test "should show mostsmallmobgene" do
    get :show, id: @mostsmallmobgene
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mostsmallmobgene
    assert_response :success
  end

  test "should update mostsmallmobgene" do
    put :update, id: @mostsmallmobgene, mostsmallmobgene: @mostsmallmobgene.attributes
    assert_redirected_to mostsmallmobgene_path(assigns(:mostsmallmobgene))
  end

  test "should destroy mostsmallmobgene" do
    assert_difference('Mostsmallmobgene.count', -1) do
      delete :destroy, id: @mostsmallmobgene
    end

    assert_redirected_to mostsmallmobgenes_path
  end
end
