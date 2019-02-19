# frozen_string_literal: true

class JobApplication < ApplicationRecord
  belongs_to :applicant
  belongs_to :job_opening
end
