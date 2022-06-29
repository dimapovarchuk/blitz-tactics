require "test_helper"

class BlitzTacticsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blitz_tactic = blitz_tactics(:one)
  end

  test "should get index" do
    get blitz_tactics_url
    assert_response :success
  end

  test "should get new" do
    get new_blitz_tactic_url
    assert_response :success
  end

  test "should create blitz_tactic" do
    assert_difference("BlitzTactic.count") do
      post blitz_tactics_url, params: { blitz_tactic: { amount: @blitz_tactic.amount, company: @blitz_tactic.company, contragent: @blitz_tactic.contragent, currency: @blitz_tactic.currency, date: @blitz_tactic.date } }
    end

    assert_redirected_to blitz_tactic_url(BlitzTactic.last)
  end

  test "should show blitz_tactic" do
    get blitz_tactic_url(@blitz_tactic)
    assert_response :success
  end

  test "should get edit" do
    get edit_blitz_tactic_url(@blitz_tactic)
    assert_response :success
  end

  test "should update blitz_tactic" do
    patch blitz_tactic_url(@blitz_tactic), params: { blitz_tactic: { amount: @blitz_tactic.amount, company: @blitz_tactic.company, contragent: @blitz_tactic.contragent, currency: @blitz_tactic.currency, date: @blitz_tactic.date } }
    assert_redirected_to blitz_tactic_url(@blitz_tactic)
  end

  test "should destroy blitz_tactic" do
    assert_difference("BlitzTactic.count", -1) do
      delete blitz_tactic_url(@blitz_tactic)
    end

    assert_redirected_to blitz_tactics_url
  end
end
