class CreateDockerServers < ActiveRecord::Migration
  def change
    create_table :docker_servers do |t|
      t.string :name
      t.string :host
      t.string :port
      t.string :type
      t.string :description
      
      t.timestamps
    end
  end
end
