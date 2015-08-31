require 'test_helper'

class Backend::ConfEventsControllerTest < ActionController::TestCase
  setup do
    @backend_conf_event = backend_conf_events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backend_conf_events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backend_conf_event" do
    assert_difference('Backend::ConfEvent.count') do
      post :create, backend_conf_event: {  }
    end

    assert_redirected_to backend_conf_event_path(assigns(:backend_conf_event))
  end

  test "should show backend_conf_event" do
    get :show, id: @backend_conf_event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backend_conf_event
    assert_response :success
  end

  test "should update backend_conf_event" do
    patch :update, id: @backend_conf_event, backend_conf_event: {  }
    assert_redirected_to backend_conf_event_path(assigns(:backend_conf_event))
  end

  test "should destroy backend_conf_event" do
    assert_difference('Backend::ConfEvent.count', -1) do
      delete :destroy, id: @backend_conf_event
    end

    assert_redirected_to backend_conf_events_path
  end
end
