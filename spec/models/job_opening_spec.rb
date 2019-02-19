# frozen_string_literal: true

# == Schema Information
#
# Table name: job_openings
#
#  id          :bigint(8)        not null, primary key
#  employer_id :bigint(8)
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_job_openings_on_employer_id  (employer_id)
#

require 'rails_helper'

RSpec.describe JobOpening, type: :model do
  let(:job_opening) { create(:job_opening) }
  let(:applicant) { create(:applicant) }
  let(:applicant2) { create(:applicant) }
  let(:employer) { create(:employer) }

  before(applied: true) do
    JobApplication.create(job_opening: job_opening, applicant: applicant)
  end

  context 'when creating' do
    it 'is valid' do
      expect(job_opening).to be_valid
    end
  end

  context '#applied?' do
    it 'is true for applicant', :applied do
      expect(job_opening.applied?(applicant)).to be true
    end

    it 'is false for non-applicant', :applied do
      expect(job_opening.applied?(applicant2)).to be false
    end
  end

  context '#can_apply?', :applied do
    it "is true for an applicant who hasn't applied" do
      expect(job_opening.can_apply?(applicant2)).to be true
    end

    it 'is false for an applicant who has already applied' do
      expect(job_opening.can_apply?(applicant)).to be false
    end

    it 'is false for an employer' do
      expect(job_opening.can_apply?(employer)).to be false
    end
  end
end
