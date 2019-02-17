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
end
