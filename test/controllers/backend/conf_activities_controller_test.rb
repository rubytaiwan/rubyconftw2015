require 'test_helper'

class Backend::ConfActivitiesControllerTest < ActionController::TestCase
  setup do
    @backend_conf_activity = backend_conf_activities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backend_conf_activities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backend_conf_activity" do
    assert_difference('Backend::ConfActivity.count') do
      post :create, backend_conf_activity: { attendee_id: @backend_conf_activity.attendee_id, event_id: @backend_conf_activity.event_id, happened_at: @backend_conf_activity.happened_at }
    end

    assert_redirected_to backend_conf_activity_path(assigns(:backend_conf_activity))
  end

  test "should show backend_conf_activity" do
    get :show, id: @backend_conf_activity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backend_conf_activity
    assert_response :success
  end

  test "should update backend_conf_activity" do
    patch :update, id: @backend_conf_activity, backend_conf_activity: { attendee_id: @backend_conf_activity.attendee_id, event_id: @backend_conf_activity.event_id, happened_at: @backend_conf_activity.happened_at }
    assert_redirected_to backend_conf_activity_path(assigns(:backend_conf_activity))
  end

  test "should destroy backend_conf_activity" do
    assert_difference('Backend::ConfActivity.count', -1) do
      delete :destroy, id: @backend_conf_activity
    end

    assert_redirected_to backend_conf_activities_path
  end
end
