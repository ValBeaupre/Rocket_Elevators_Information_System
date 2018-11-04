require 'test_helper'

class ChartsControllerTest < ActionDispatch::IntegrationTest
  test "should get contacts" do
    get charts_contacts_url
    assert_response :success
  end

  test "should get quotes" do
    get charts_quotes_url
    assert_response :success
  end

  test "should get elevators_per_client" do
    get charts_elevators_per_client_url
    assert_response :success
  end

end
