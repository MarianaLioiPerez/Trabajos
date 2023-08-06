require "test_helper"

class AplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @aplication = aplications(:one)
  end

  test "should get index" do
    get aplications_url
    assert_response :success
  end

  test "should get new" do
    get new_aplication_url
    assert_response :success
  end

  test "should create aplication" do
    assert_difference("Aplication.count") do
      post aplications_url, params: { aplication: { job_offer_id: @aplication.job_offer_id, text: @aplication.text, tuser_id: @aplication.tuser_id } }
    end

    assert_redirected_to aplication_url(Aplication.last)
  end

  test "should show aplication" do
    get aplication_url(@aplication)
    assert_response :success
  end

  test "should get edit" do
    get edit_aplication_url(@aplication)
    assert_response :success
  end

  test "should update aplication" do
    patch aplication_url(@aplication), params: { aplication: { job_offer_id: @aplication.job_offer_id, text: @aplication.text, tuser_id: @aplication.tuser_id } }
    assert_redirected_to aplication_url(@aplication)
  end

  test "should destroy aplication" do
    assert_difference("Aplication.count", -1) do
      delete aplication_url(@aplication)
    end

    assert_redirected_to aplications_url
  end
end
