require "test_helper"

class TransactionCategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get transaction_categories_index_url
    assert_response :success
  end

  test "should get show" do
    get transaction_categories_show_url
    assert_response :success
  end

  test "should get edit" do
    get transaction_categories_edit_url
    assert_response :success
  end

  test "should get new" do
    get transaction_categories_new_url
    assert_response :success
  end

  test "should get destroy" do
    get transaction_categories_destroy_url
    assert_response :success
  end
end
