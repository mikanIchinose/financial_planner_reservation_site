require "application_system_test_case"

class FinancialPlannersTest < ApplicationSystemTestCase
  setup do
    @financial_planner = financial_planners(:one)
  end

  test "visiting the index" do
    visit financial_planners_url
    assert_selector "h1", text: "Financial Planners"
  end

  test "creating a Financial planner" do
    visit financial_planners_url
    click_on "New Financial Planner"

    fill_in "Email", with: @financial_planner.email
    fill_in "Name", with: @financial_planner.name
    fill_in "Phone number", with: @financial_planner.phone_number
    click_on "Create Financial planner"

    assert_text "Financial planner was successfully created"
    click_on "Back"
  end

  test "updating a Financial planner" do
    visit financial_planners_url
    click_on "Edit", match: :first

    fill_in "Email", with: @financial_planner.email
    fill_in "Name", with: @financial_planner.name
    fill_in "Phone number", with: @financial_planner.phone_number
    click_on "Update Financial planner"

    assert_text "Financial planner was successfully updated"
    click_on "Back"
  end

  test "destroying a Financial planner" do
    visit financial_planners_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Financial planner was successfully destroyed"
  end
end
