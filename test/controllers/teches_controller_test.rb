require "test_helper"

class TechesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tech = teches(:one)
  end

  test "should get index" do
    get teches_url, as: :json
    assert_response :success
  end

  test "should create tech" do
    assert_difference("Tech.count") do
      post teches_url, params: { tech: { name: @tech.name } }, as: :json
    end

    assert_response :created
  end

  test "should show tech" do
    get tech_url(@tech), as: :json
    assert_response :success
  end

  test "should update tech" do
    patch tech_url(@tech), params: { tech: { name: @tech.name } }, as: :json
    assert_response :success
  end

  test "should destroy tech" do
    assert_difference("Tech.count", -1) do
      delete tech_url(@tech), as: :json
    end

    assert_response :no_content
  end
end
