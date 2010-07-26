require File.expand_path('../test_helper', __FILE__)

# Mock controller used for testing session handling.
class CookieController < ApplicationController
  authenticates_using_session
    
  def show
    if current_user
      render :text => "User: #{current_user.id}"
    else
      render :text => "No user"
    end
  end
end

class CookieControllerTest < ActionController::TestCase
  setup do
    @user = users(:john)
  end

  test "no user_id in session" do
    get :show
    assert_response :success
    assert_nil assigns(:current_user)
    assert_equal 'No user', response.body
  end
  
  test "valid user_id in session" do
    set_session_current_user @user
    get :show
    assert_response :success
    assert_equal @user, assigns(:current_user)
    assert_equal "User: #{Fixtures.identify(:john)}", response.body
  end
  
  test "invalid user_id in session" do
    get :show, {}, :current_user_id => 999
    assert_response :success
    assert_nil assigns(:current_user)
  end
end
