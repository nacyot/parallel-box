class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references :user
      t.references :application

      t.timestamps
    end
  end
end
