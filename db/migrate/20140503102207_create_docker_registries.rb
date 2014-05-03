class CreateDockerRegistries < ActiveRecord::Migration
  def change
    create_table :docker_registries do |t|
      t.string :name
      t.string :host
      t.string :port
      t.string :description
      
      t.timestamps
    end
  end
end
