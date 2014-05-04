# == Schema Information
#
# Table name: applications
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Application < ActiveRecord::Base
  belongs_to :docker_registry
  has_many :docker_servers
end
