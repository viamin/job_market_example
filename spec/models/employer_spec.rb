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

require 'rails_helper'

RSpec.describe Employer, type: :model do
  let(:employer) { create(:employer) }
  let(:dupe) { build(:employer, email: employer.email) }

  context 'when creating' do
    it 'is valid' do
      expect(employer).to be_valid
    end

    it 'is invalid with duplicate email' do
      expect(dupe).to be_invalid
    end
  end
end
