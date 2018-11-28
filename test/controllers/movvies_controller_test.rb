require 'test_helper'

class MovviesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movvy = movvies(:one)
  end

  test "should get index" do
    get movvies_url, as: :json
    assert_response :success
  end

  test "should create movvy" do
    assert_difference('Movvy.count') do
      post movvies_url, params: { movvy: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show movvy" do
    get movvy_url(@movvy), as: :json
    assert_response :success
  end

  test "should update movvy" do
    patch movvy_url(@movvy), params: { movvy: {  } }, as: :json
    assert_response 200
  end

  test "should destroy movvy" do
    assert_difference('Movvy.count', -1) do
      delete movvy_url(@movvy), as: :json
    end

    assert_response 204
  end
end
