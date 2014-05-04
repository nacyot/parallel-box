class AddRepositoryUrlAndContinuousIntegrationUrlToApplication < ActiveRecord::Migration
  def change
    add_column :applications, :repository_url, :string
    add_column :applications, :continuous_integration_url, :string
  end
end
