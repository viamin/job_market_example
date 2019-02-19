# frozen_string_literal: true

class CreateJobApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :job_applications do |t|
      t.references :applicant, foreign_key: true
      t.references :job_opening, foreign_key: true

      t.timestamps
    end
  end
end
