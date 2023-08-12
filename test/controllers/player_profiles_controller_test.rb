require "test_helper"

class PlayerProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player_profile = player_profiles(:one)
  end

  test "should get index" do
    get player_profiles_url, as: :json
    assert_response :success
  end

  test "should create player_profile" do
    assert_difference("PlayerProfile.count") do
      post player_profiles_url, params: { player_profile: { email: @player_profile.email, password: @player_profile.password, username: @player_profile.username } }, as: :json
    end

    assert_response :created
  end

  test "should show player_profile" do
    get player_profile_url(@player_profile), as: :json
    assert_response :success
  end

  test "should update player_profile" do
    patch player_profile_url(@player_profile), params: { player_profile: { email: @player_profile.email, password: @player_profile.password, username: @player_profile.username } }, as: :json
    assert_response :success
  end

  test "should destroy player_profile" do
    assert_difference("PlayerProfile.count", -1) do
      delete player_profile_url(@player_profile), as: :json
    end

    assert_response :no_content
  end
end
