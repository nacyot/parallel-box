class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :name, null: false
      t.integer :docker_registry_id
      t.string :url
      
      t.timestamps
    end
  end
end
