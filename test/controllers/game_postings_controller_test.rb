require "test_helper"

class GamePostingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_posting = game_postings(:one)
  end

  test "should get index" do
    get game_postings_url, as: :json
    assert_response :success
  end

  test "should create game_posting" do
    assert_difference("GamePosting.count") do
      post game_postings_url, params: { game_posting: { title: @game_posting.title } }, as: :json
    end

    assert_response :created
  end

  test "should show game_posting" do
    get game_posting_url(@game_posting), as: :json
    assert_response :success
  end

  test "should update game_posting" do
    patch game_posting_url(@game_posting), params: { game_posting: { title: @game_posting.title } }, as: :json
    assert_response :success
  end

  test "should destroy game_posting" do
    assert_difference("GamePosting.count", -1) do
      delete game_posting_url(@game_posting), as: :json
    end

    assert_response :no_content
  end
end
