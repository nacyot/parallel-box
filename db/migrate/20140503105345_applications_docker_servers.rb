class ApplicationsDockerServers < ActiveRecord::Migration
  def change
    def self.up
      create_table :applications_docker_servers, :id => false do |t|
        t.references :application
        t.references :docker
      end

      add_index :applications_docker_servers, [:application_id, :docker_server_id]
      add_index :applications_docker_servers, :application_id
      add_index :applications_docker_servers, :docker_server_id
    end
  end
end
