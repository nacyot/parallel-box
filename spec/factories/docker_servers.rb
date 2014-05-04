# == Schema Information
#
# Table name: docker_servers
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  host        :string(255)
#  port        :string(255)
#  type        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :docker_server do
  end
end
