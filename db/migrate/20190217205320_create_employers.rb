# frozen_string_literal: true

class CreateEmployers < ActiveRecord::Migration[5.2]
  def change
    create_table :employers do |t|
      t.citext :email, null: false
      t.string :password_digest
      t.string :name

      t.timestamps
    end

    add_index :employers, :email, unique: true
  end
end
