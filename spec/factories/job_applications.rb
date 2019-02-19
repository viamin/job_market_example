# frozen_string_literal: true

FactoryBot.define do
  factory :job_application do
    association :applicant
    association :job_opening
  end
end
