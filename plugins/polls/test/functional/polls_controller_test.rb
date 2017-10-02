require File.expand_path('../../test_helper', __FILE__)

class PollsControllerTest < ActionController::TestCase
  fixtures :projects

  def test_index
    get :index, :project_id => 1

    assert_response :success
    assert_template 'index'
  end
end
