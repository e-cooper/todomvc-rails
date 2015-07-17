require 'test_helper'

class TodosControllerTest < ActionController::TestCase
  setup do
    @todo = todos(:one)
  end

  test "should get index" do
    get :index, format: :json
    assert_response :success
  end

  test "should create todo" do
    assert_difference('Todo.count') do
      post :create, format: :json, todo: { title: 'A new todo.' }
    end

    assert_response :success
  end

  test "should show todo" do
    get :show, format: :json, id: @todo
    assert_response :success
  end

  test "should update todo" do
    patch :update, format: :json, id: @todo, todo: { title: 'updated title' }
    assert_response :success
  end

  test "should destroy todo" do
    assert_difference('Todo.count', -1) do
      delete :destroy, format: :json, id: @todo
    end

    assert_response :success
  end
end
