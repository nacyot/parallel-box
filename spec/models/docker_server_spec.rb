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

require 'spec_helper'

describe DockerServer do
  pending "add some examples to (or delete) #{__FILE__}"
end
