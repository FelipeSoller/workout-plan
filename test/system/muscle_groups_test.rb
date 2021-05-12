require "application_system_test_case"

class MuscleGroupsTest < ApplicationSystemTestCase
  setup do
    @muscle_group = muscle_groups(:one)
  end

  test "visiting the index" do
    visit muscle_groups_url
    assert_selector "h1", text: "Muscle Groups"
  end

  test "creating a Muscle group" do
    visit muscle_groups_url
    click_on "New Muscle Group"

    fill_in "Title", with: @muscle_group.title
    click_on "Create Muscle group"

    assert_text "Muscle group was successfully created"
    click_on "Back"
  end

  test "updating a Muscle group" do
    visit muscle_groups_url
    click_on "Edit", match: :first

    fill_in "Title", with: @muscle_group.title
    click_on "Update Muscle group"

    assert_text "Muscle group was successfully updated"
    click_on "Back"
  end

  test "destroying a Muscle group" do
    visit muscle_groups_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Muscle group was successfully destroyed"
  end
end
