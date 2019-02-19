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

require 'rails_helper'

RSpec.describe Applicant, type: :model do
  let(:applicant) { create(:applicant) }
  let(:dupe) { build(:applicant, email: applicant.email) }

  context 'when creating' do
    it 'is valid' do
      expect(applicant).to be_valid
    end

    it 'is invalid with duplicate email' do
      expect(dupe).to be_invalid
    end
  end
end
