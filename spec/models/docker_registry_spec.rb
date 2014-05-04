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

require 'spec_helper'

describe DockerRegistry do
  pending "add some examples to (or delete) #{__FILE__}"
end
