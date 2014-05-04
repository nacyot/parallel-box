class RenameTypeToServerTypeInDockerServer < ActiveRecord::Migration
  def change
    rename_column :docker_servers, :type, :server_type
  end
end
