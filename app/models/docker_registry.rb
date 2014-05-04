# == Schema Information
#
# Table name: docker_registries
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  host        :string(255)
#  port        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class DockerRegistry < ActiveRecord::Base
  has_many :applications

  def box(app)
    DockerRegistryBox.new(host, port, app.repository_name)
  end
end
