require "test_helper"

class ItemsLoaderControllerTest < ActionDispatch::IntegrationTest
  test "should get load_csv" do
    get items_loader_load_csv_url
    assert_response :success
  end
end
