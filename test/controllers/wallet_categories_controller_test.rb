require "test_helper"

class WalletCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get wallet_categories_index_url
    assert_response :success
  end

  test "should get show" do
    get wallet_categories_show_url
    assert_response :success
  end

  test "should get edit" do
    get wallet_categories_edit_url
    assert_response :success
  end

  test "should get new" do
    get wallet_categories_new_url
    assert_response :success
  end

  test "should get create" do
    get wallet_categories_new_url
    assert_response :success
  end

  test "should get destroy" do
    get wallet_categories_destroy_url
    assert_response :success
  end
end
