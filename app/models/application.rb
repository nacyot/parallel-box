class Application < ActiveRecord::Base
  has_many :docker_servers, through: :applications_docker_servers
end
