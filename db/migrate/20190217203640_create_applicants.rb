# frozen_string_literal: true

class CreateApplicants < ActiveRecord::Migration[5.2]
  def change
    enable_extension('citext')

    create_table :applicants do |t|
      t.citext :email, null: false
      t.string :password_digest
      t.string :name

      t.timestamps
    end

    add_index :applicants, :email, unique: true
  end
end
