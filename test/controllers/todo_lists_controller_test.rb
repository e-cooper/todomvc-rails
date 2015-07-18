require 'test_helper'

class TodoListsControllerTest < ActionController::TestCase
  setup do
    @todo_list = todo_lists(:one)
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should create todo_list" do
    assert_difference('TodoList.count') do
      post :create, format: :json, list: { todos_attributes: [] }
    end
    assert_response :created
  end

  test "should show todo_list" do
    get :show, format: :json, id: @todo_list
    assert_response :success
  end

  test "should update todo_list" do
    patch :update, format: :json, id: @todo_list, list: { todos_attributes: [{
        title: "Some todo."
      },{
        title: "Another todo."
      }]}
    assert_response :success
  end

  test "should destroy todo_list" do
    assert_difference('TodoList.count', -1) do
      delete :destroy, format: :json, id: @todo_list
    end
    assert_response :success
  end
end
