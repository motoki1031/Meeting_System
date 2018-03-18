require 'test_helper'

class AtendeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @atendee = atendees(:one)
  end

  test "should get index" do
    get atendees_url
    assert_response :success
  end

  test "should get new" do
    get new_atendee_url
    assert_response :success
  end

  test "should create atendee" do
    assert_difference('Atendee.count') do
      post atendees_url, params: { atendee: { meeting_id: @atendee.meeting_id, name: @atendee.name } }
    end

    assert_redirected_to atendee_url(Atendee.last)
  end

  test "should show atendee" do
    get atendee_url(@atendee)
    assert_response :success
  end

  test "should get edit" do
    get edit_atendee_url(@atendee)
    assert_response :success
  end

  test "should update atendee" do
    patch atendee_url(@atendee), params: { atendee: { meeting_id: @atendee.meeting_id, name: @atendee.name } }
    assert_redirected_to atendee_url(@atendee)
  end

  test "should destroy atendee" do
    assert_difference('Atendee.count', -1) do
      delete atendee_url(@atendee)
    end

    assert_redirected_to atendees_url
  end
end
