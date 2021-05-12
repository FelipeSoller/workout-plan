require "test_helper"

class MuscleGroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @muscle_group = muscle_groups(:one)
  end

  test "should get index" do
    get muscle_groups_url
    assert_response :success
  end

  test "should get new" do
    get new_muscle_group_url
    assert_response :success
  end

  test "should create muscle_group" do
    assert_difference('MuscleGroup.count') do
      post muscle_groups_url, params: { muscle_group: { title: @muscle_group.title } }
    end

    assert_redirected_to muscle_group_url(MuscleGroup.last)
  end

  test "should show muscle_group" do
    get muscle_group_url(@muscle_group)
    assert_response :success
  end

  test "should get edit" do
    get edit_muscle_group_url(@muscle_group)
    assert_response :success
  end

  test "should update muscle_group" do
    patch muscle_group_url(@muscle_group), params: { muscle_group: { title: @muscle_group.title } }
    assert_redirected_to muscle_group_url(@muscle_group)
  end

  test "should destroy muscle_group" do
    assert_difference('MuscleGroup.count', -1) do
      delete muscle_group_url(@muscle_group)
    end

    assert_redirected_to muscle_groups_url
  end
end
