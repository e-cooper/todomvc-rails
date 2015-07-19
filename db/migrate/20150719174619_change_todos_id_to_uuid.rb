class ChangeTodosIdToUuid < ActiveRecord::Migration
  def change
    enable_extension 'uuid-ossp' unless extension_enabled?('uuid-ossp')
    remove_column :todos, :id, :primary_key
    add_column :todos, :id, :uuid, primary_key: true, default: 'uuid_generate_v4()'
  end
end
