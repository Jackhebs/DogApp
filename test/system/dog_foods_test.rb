require "application_system_test_case"

class DogFoodsTest < ApplicationSystemTestCase
  setup do
    @dog_food = dog_foods(:one)
  end

  test "visiting the index" do
    visit dog_foods_url
    assert_selector "h1", text: "Dog Foods"
  end

  test "creating a Dog food" do
    visit dog_foods_url
    click_on "New Dog Food"

    fill_in "Dog", with: @dog_food.dog_id
    fill_in "Food", with: @dog_food.food_id
    click_on "Create Dog food"

    assert_text "Dog food was successfully created"
    click_on "Back"
  end

  test "updating a Dog food" do
    visit dog_foods_url
    click_on "Edit", match: :first

    fill_in "Dog", with: @dog_food.dog_id
    fill_in "Food", with: @dog_food.food_id
    click_on "Update Dog food"

    assert_text "Dog food was successfully updated"
    click_on "Back"
  end

  test "destroying a Dog food" do
    visit dog_foods_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dog food was successfully destroyed"
  end
end
