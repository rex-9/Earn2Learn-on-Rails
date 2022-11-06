require "test_helper"

class ProfessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profession = professions(:one)
  end

  test "should get index" do
    get professions_url, as: :json
    assert_response :success
  end

  test "should create profession" do
    assert_difference("Profession.count") do
      post professions_url, params: { profession: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show profession" do
    get profession_url(@profession), as: :json
    assert_response :success
  end

  test "should update profession" do
    patch profession_url(@profession), params: { profession: {  } }, as: :json
    assert_response :success
  end

  test "should destroy profession" do
    assert_difference("Profession.count", -1) do
      delete profession_url(@profession), as: :json
    end

    assert_response :no_content
  end
end
