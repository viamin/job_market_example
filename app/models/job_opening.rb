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

class JobOpening < ApplicationRecord
  belongs_to :employer
  has_many :job_applications
  has_many :applicants, through: :job_applications

  def applied?(applicant)
    applicants.include?(applicant)
  end

  def can_apply?(applicant)
    applicant.instance_of?(Applicant) && !applied?(applicant)
  end
end
