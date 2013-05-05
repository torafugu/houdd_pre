require 'test_helper'

class MediumGenesControllerTest < ActionController::TestCase
  setup do
    @medium_gene = medium_genes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium_genes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium_gene" do
    assert_difference('MediumGene.count') do
      post :create, medium_gene: @medium_gene.attributes
    end

    assert_redirected_to medium_gene_path(assigns(:medium_gene))
  end

  test "should show medium_gene" do
    get :show, id: @medium_gene
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium_gene
    assert_response :success
  end

  test "should update medium_gene" do
    put :update, id: @medium_gene, medium_gene: @medium_gene.attributes
    assert_redirected_to medium_gene_path(assigns(:medium_gene))
  end

  test "should destroy medium_gene" do
    assert_difference('MediumGene.count', -1) do
      delete :destroy, id: @medium_gene
    end

    assert_redirected_to medium_genes_path
  end
end
