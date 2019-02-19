# frozen_string_literal: true

# == Schema Information
#
# Table name: applicants
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
#  index_applicants_on_email  (email) UNIQUE
#

class Applicant < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
end
