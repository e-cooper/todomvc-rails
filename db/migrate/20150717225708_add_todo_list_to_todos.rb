class AddTodoListToTodos < ActiveRecord::Migration
  def change
    add_reference :todos, :todo_list, index: true, foreign_key: true
  end
end
