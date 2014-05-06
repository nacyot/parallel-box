# == Schema Information
#
# Table name: applications
#
#  id                         :integer          not null, primary key
#  name                       :string(255)      not null
#  docker_registry_id         :integer
#  url                        :string(255)
#  created_at                 :datetime
#  updated_at                 :datetime
#  repository_name            :string(255)
#  repository_url             :string(255)
#  continuous_integration_url :string(255)
#

class Application < ActiveRecord::Base
  include PublicActivity::Model
  tracked
  
  belongs_to :docker_registry
  has_many :docker_servers
  has_many :members
  has_many :users, through: :members
end
