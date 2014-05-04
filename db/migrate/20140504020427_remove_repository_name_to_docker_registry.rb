class RemoveRepositoryNameToDockerRegistry < ActiveRecord::Migration
  def change
    remove_column :docker_registries, :repository_name
  end
end
