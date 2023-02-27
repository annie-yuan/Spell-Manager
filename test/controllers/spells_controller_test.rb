require "test_helper"

class SpellsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spell = spells(:one)
  end

  test "should get index" do
    get spells_url
    assert_response :success
  end

  test "should get new" do
    get new_spell_url
    assert_response :success
  end

  test "should create spell" do
    assert_difference('Spell.count') do
      post spells_url, params: { spell: { concentration: @spell.concentration, description: @spell.description, is_bard: @spell.is_bard, is_cleric: @spell.is_cleric, is_druid: @spell.is_druid, is_paladin: @spell.is_paladin, is_ranger: @spell.is_ranger, is_sorcerer: @spell.is_sorcerer, is_warlock: @spell.is_warlock, is_wizard: @spell.is_wizard, level: @spell.level, name: @spell.name, school: @spell.school } }
    end

    assert_redirected_to spell_url(Spell.last)
  end

  test "should show spell" do
    get spell_url(@spell)
    assert_response :success
  end

  test "should get edit" do
    get edit_spell_url(@spell)
    assert_response :success
  end

  test "should update spell" do
    patch spell_url(@spell), params: { spell: { concentration: @spell.concentration, description: @spell.description, is_bard: @spell.is_bard, is_cleric: @spell.is_cleric, is_druid: @spell.is_druid, is_paladin: @spell.is_paladin, is_ranger: @spell.is_ranger, is_sorcerer: @spell.is_sorcerer, is_warlock: @spell.is_warlock, is_wizard: @spell.is_wizard, level: @spell.level, name: @spell.name, school: @spell.school } }
    assert_redirected_to spell_url(@spell)
  end

  test "should destroy spell" do
    assert_difference('Spell.count', -1) do
      delete spell_url(@spell)
    end

    assert_redirected_to spells_url
  end
end
