require "test_helper"

class StudiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @study = studies(:one)
  end

  test "should get index" do
    get studies_url, as: :json
    assert_response :success
  end

  test "should create study" do
    assert_difference("Study.count") do
      post studies_url, params: { study: { name: @study.name } }, as: :json
    end

    assert_response :created
  end

  test "should show study" do
    get study_url(@study), as: :json
    assert_response :success
  end

  test "should update study" do
    patch study_url(@study), params: { study: { name: @study.name } }, as: :json
    assert_response :success
  end

  test "should destroy study" do
    assert_difference("Study.count", -1) do
      delete study_url(@study), as: :json
    end

    assert_response :no_content
  end
end
