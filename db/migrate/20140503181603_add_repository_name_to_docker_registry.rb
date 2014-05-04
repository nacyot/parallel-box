class AddRepositoryNameToDockerRegistry < ActiveRecord::Migration
  def change
    add_column :docker_registries, :repository_name, :string
  end
end
