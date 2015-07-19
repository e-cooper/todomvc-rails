class TodoList < ActiveRecord::Base
  has_many :todos, autosave: true

  def update_and_replace_todos(attrs)
    replace_todos(attrs.delete(:todos_attributes))
    assign_attributes(attrs)
    save
  end

  def replace_todos(attrs)
    todo_attributes = attrs.values
    todo_ids = todo_attributes.map {|t| t['id'] || t[:id] }.compact

    todo_attributes.each do |attributes|
      attributes = attributes.with_indifferent_access
      if existing_todo = todos.target.detect { |record| record.id.to_s == attributes['id'].to_s }
        existing_todo.assign_attributes(attributes)
      else
        todos.build(attributes)
      end
    end

    todos.target.reject{ |t| todo_ids.include?(t.id) }.each(&:mark_for_destruction)
  end
end
