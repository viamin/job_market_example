# frozen_string_literal: true

class CreateJobOpenings < ActiveRecord::Migration[5.2]
  def change
    create_table :job_openings do |t|
      t.references :employer, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
