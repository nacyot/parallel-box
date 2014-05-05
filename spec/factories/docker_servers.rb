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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :docker_server do
  end
end
