require "application_system_test_case"

class GuidesTest < ApplicationSystemTestCase
  setup do
    @guide = guides(:one)
  end

  test "visiting the index" do
    visit guides_url
    assert_selector "h1", text: "Guides"
  end

  test "creating a Guide" do
    visit guides_url
    click_on "New Guide"

    fill_in "Name", with: @guide.name
    fill_in "Surname", with: @guide.surname
    fill_in "Telnumber", with: @guide.telnumber
    click_on "Create Guide"

    assert_text "Guide was successfully created"
    click_on "Back"
  end

  test "updating a Guide" do
    visit guides_url
    click_on "Edit", match: :first

    fill_in "Name", with: @guide.name
    fill_in "Surname", with: @guide.surname
    fill_in "Telnumber", with: @guide.telnumber
    click_on "Update Guide"

    assert_text "Guide was successfully updated"
    click_on "Back"
  end

  test "destroying a Guide" do
    visit guides_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Guide was successfully destroyed"
  end
end
