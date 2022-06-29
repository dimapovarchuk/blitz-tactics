require "application_system_test_case"

class BlitzTacticsTest < ApplicationSystemTestCase
  setup do
    @blitz_tactic = blitz_tactics(:one)
  end

  test "visiting the index" do
    visit blitz_tactics_url
    assert_selector "h1", text: "Blitz tactics"
  end

  test "should create blitz tactic" do
    visit blitz_tactics_url
    click_on "New blitz tactic"

    fill_in "Amount", with: @blitz_tactic.amount
    fill_in "Company", with: @blitz_tactic.company
    fill_in "Contragent", with: @blitz_tactic.contragent
    fill_in "Currency", with: @blitz_tactic.currency
    fill_in "Date", with: @blitz_tactic.date
    click_on "Create Blitz tactic"

    assert_text "Blitz tactic was successfully created"
    click_on "Back"
  end

  test "should update Blitz tactic" do
    visit blitz_tactic_url(@blitz_tactic)
    click_on "Edit this blitz tactic", match: :first

    fill_in "Amount", with: @blitz_tactic.amount
    fill_in "Company", with: @blitz_tactic.company
    fill_in "Contragent", with: @blitz_tactic.contragent
    fill_in "Currency", with: @blitz_tactic.currency
    fill_in "Date", with: @blitz_tactic.date
    click_on "Update Blitz tactic"

    assert_text "Blitz tactic was successfully updated"
    click_on "Back"
  end

  test "should destroy Blitz tactic" do
    visit blitz_tactic_url(@blitz_tactic)
    click_on "Destroy this blitz tactic", match: :first

    assert_text "Blitz tactic was successfully destroyed"
  end
end
