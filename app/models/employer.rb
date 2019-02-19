# frozen_string_literal: true

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

class Employer < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true

  has_many :job_openings
end
