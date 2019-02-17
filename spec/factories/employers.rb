# == Schema Information
#
# Table name: employers
#
#  id              :bigint(8)        not null, primary key
#  email           :citext           not null
#  password_digest :string
#  name            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_employers_on_email  (email) UNIQUE
#

FactoryBot.define do
  factory :employer do
    email { Faker::Internet.email }
    password { SecureRandom.base64(20) }
    name { Faker::Company.name }
  end
end
