require "application_system_test_case"

class SpellsTest < ApplicationSystemTestCase
  setup do
    @spell = spells(:one)
  end

  test "visiting the index" do
    visit spells_url
    assert_selector "h1", text: "Spells"
  end

  test "creating a Spell" do
    visit spells_url
    click_on "New Spell"

    fill_in "Concentration", with: @spell.concentration
    fill_in "Description", with: @spell.description
    check "Is bard" if @spell.is_bard
    check "Is cleric" if @spell.is_cleric
    check "Is druid" if @spell.is_druid
    check "Is paladin" if @spell.is_paladin
    check "Is ranger" if @spell.is_ranger
    check "Is sorcerer" if @spell.is_sorcerer
    check "Is warlock" if @spell.is_warlock
    check "Is wizard" if @spell.is_wizard
    fill_in "Level", with: @spell.level
    fill_in "Name", with: @spell.name
    fill_in "School", with: @spell.school
    click_on "Create Spell"

    assert_text "Spell was successfully created"
    click_on "Back"
  end

  test "updating a Spell" do
    visit spells_url
    click_on "Edit", match: :first

    fill_in "Concentration", with: @spell.concentration
    fill_in "Description", with: @spell.description
    check "Is bard" if @spell.is_bard
    check "Is cleric" if @spell.is_cleric
    check "Is druid" if @spell.is_druid
    check "Is paladin" if @spell.is_paladin
    check "Is ranger" if @spell.is_ranger
    check "Is sorcerer" if @spell.is_sorcerer
    check "Is warlock" if @spell.is_warlock
    check "Is wizard" if @spell.is_wizard
    fill_in "Level", with: @spell.level
    fill_in "Name", with: @spell.name
    fill_in "School", with: @spell.school
    click_on "Update Spell"

    assert_text "Spell was successfully updated"
    click_on "Back"
  end

  test "destroying a Spell" do
    visit spells_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Spell was successfully destroyed"
  end
end
