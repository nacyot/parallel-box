# == Schema Information
#
# Table name: docker_servers
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  host           :string(255)
#  port           :string(255)
#  server_type    :string(255)
#  description    :string(255)
#  application_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class DockerServer < ActiveRecord::Base
  include PublicActivity::Model
  tracked
  
  belongs_to :application

  def box
    @box || @box = DockerServerBox.new(host, port)
  end

  def url
    host + ":" + port
  end
end
