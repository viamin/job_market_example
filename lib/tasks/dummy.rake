# frozen_string_literal: true

namespace :dummy do
  desc 'Generate a bunch of fake companies and job openings'
  task job_openings: :environment do
    puts 'Creating 5 Employers with 5 Job Openings each'
    5.times do
      FactoryBot.create(:employer, :with_job_openings)
    end
  end
end
