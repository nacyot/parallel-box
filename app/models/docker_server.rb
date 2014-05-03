class DockerServer < ActiveRecord::Base
  has_many :applications, through: :applications_docker_servers
end
