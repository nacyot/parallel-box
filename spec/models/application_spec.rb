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

require 'spec_helper'

describe Application do
  pending "add some examples to (or delete) #{__FILE__}"
end
