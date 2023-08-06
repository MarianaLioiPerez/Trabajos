require "application_system_test_case"

class AplicationsTest < ApplicationSystemTestCase
  setup do
    @aplication = aplications(:one)
  end

  test "visiting the index" do
    visit aplications_url
    assert_selector "h1", text: "Aplications"
  end

  test "should create aplication" do
    visit aplications_url
    click_on "New aplication"

    fill_in "Job offer", with: @aplication.job_offer_id
    fill_in "Text", with: @aplication.text
    fill_in "Tuser", with: @aplication.tuser_id
    click_on "Create Aplication"

    assert_text "Aplication was successfully created"
    click_on "Back"
  end

  test "should update Aplication" do
    visit aplication_url(@aplication)
    click_on "Edit this aplication", match: :first

    fill_in "Job offer", with: @aplication.job_offer_id
    fill_in "Text", with: @aplication.text
    fill_in "Tuser", with: @aplication.tuser_id
    click_on "Update Aplication"

    assert_text "Aplication was successfully updated"
    click_on "Back"
  end

  test "should destroy Aplication" do
    visit aplication_url(@aplication)
    click_on "Destroy this aplication", match: :first

    assert_text "Aplication was successfully destroyed"
  end
end
