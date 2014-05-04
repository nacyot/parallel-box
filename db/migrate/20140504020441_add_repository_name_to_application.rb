class AddRepositoryNameToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :repository_name, :string
  end
end
