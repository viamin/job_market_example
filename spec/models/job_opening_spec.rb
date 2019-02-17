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

  context 'when creating' do
    it 'is valid' do
      expect(job_opening).to be_valid
    end
  end
end
