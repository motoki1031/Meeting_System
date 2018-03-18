require 'test_helper'

class PresentersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @presenter = presenters(:one)
  end

  test "should get index" do
    get presenters_url
    assert_response :success
  end

  test "should get new" do
    get new_presenter_url
    assert_response :success
  end

  test "should create presenter" do
    assert_difference('Presenter.count') do
      post presenters_url, params: { presenter: { document1: @presenter.document1, document2: @presenter.document2, document3: @presenter.document3, document4: @presenter.document4, meeting_id: @presenter.meeting_id, name: @presenter.name, title: @presenter.title } }
    end

    assert_redirected_to presenter_url(Presenter.last)
  end

  test "should show presenter" do
    get presenter_url(@presenter)
    assert_response :success
  end

  test "should get edit" do
    get edit_presenter_url(@presenter)
    assert_response :success
  end

  test "should update presenter" do
    patch presenter_url(@presenter), params: { presenter: { document1: @presenter.document1, document2: @presenter.document2, document3: @presenter.document3, document4: @presenter.document4, meeting_id: @presenter.meeting_id, name: @presenter.name, title: @presenter.title } }
    assert_redirected_to presenter_url(@presenter)
  end

  test "should destroy presenter" do
    assert_difference('Presenter.count', -1) do
      delete presenter_url(@presenter)
    end

    assert_redirected_to presenters_url
  end
end
