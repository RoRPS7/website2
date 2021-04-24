require "application_system_test_case"

class AttractionsTest < ApplicationSystemTestCase
  setup do
    @attraction = attractions(:one)
  end

  test "visiting the index" do
    visit attractions_url
    assert_selector "h1", text: "Attractions"
  end

  test "creating a Attraction" do
    visit attractions_url
    click_on "New Attraction"

    fill_in "Category", with: @attraction.category_id
    fill_in "Description", with: @attraction.description
    fill_in "Name", with: @attraction.name
    fill_in "Price", with: @attraction.price
    fill_in "Time", with: @attraction.time
    fill_in "X", with: @attraction.x
    fill_in "Y", with: @attraction.y
    click_on "Create Attraction"

    assert_text "Attraction was successfully created"
    click_on "Back"
  end

  test "updating a Attraction" do
    visit attractions_url
    click_on "Edit", match: :first

    fill_in "Category", with: @attraction.category_id
    fill_in "Description", with: @attraction.description
    fill_in "Name", with: @attraction.name
    fill_in "Price", with: @attraction.price
    fill_in "Time", with: @attraction.time
    fill_in "X", with: @attraction.x
    fill_in "Y", with: @attraction.y
    click_on "Update Attraction"

    assert_text "Attraction was successfully updated"
    click_on "Back"
  end

  test "destroying a Attraction" do
    visit attractions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Attraction was successfully destroyed"
  end
end
