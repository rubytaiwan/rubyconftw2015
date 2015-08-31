require 'test_helper'

class Backend::ConfAttendeesControllerTest < ActionController::TestCase
  setup do
    @backend_conf_attendee = backend_conf_attendees(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backend_conf_attendees)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backend_conf_attendee" do
    assert_difference('Backend::ConfAttendee.count') do
      post :create, backend_conf_attendee: { check_code: @backend_conf_attendee.check_code, email: @backend_conf_attendee.email, github: @backend_conf_attendee.github, identity: @backend_conf_attendee.identity, name: @backend_conf_attendee.name, org: @backend_conf_attendee.org, ticket_type: @backend_conf_attendee.ticket_type, title: @backend_conf_attendee.title, twitter: @backend_conf_attendee.twitter }
    end

    assert_redirected_to backend_conf_attendee_path(assigns(:backend_conf_attendee))
  end

  test "should show backend_conf_attendee" do
    get :show, id: @backend_conf_attendee
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backend_conf_attendee
    assert_response :success
  end

  test "should update backend_conf_attendee" do
    patch :update, id: @backend_conf_attendee, backend_conf_attendee: { check_code: @backend_conf_attendee.check_code, email: @backend_conf_attendee.email, github: @backend_conf_attendee.github, identity: @backend_conf_attendee.identity, name: @backend_conf_attendee.name, org: @backend_conf_attendee.org, ticket_type: @backend_conf_attendee.ticket_type, title: @backend_conf_attendee.title, twitter: @backend_conf_attendee.twitter }
    assert_redirected_to backend_conf_attendee_path(assigns(:backend_conf_attendee))
  end

  test "should destroy backend_conf_attendee" do
    assert_difference('Backend::ConfAttendee.count', -1) do
      delete :destroy, id: @backend_conf_attendee
    end

    assert_redirected_to backend_conf_attendees_path
  end
end
