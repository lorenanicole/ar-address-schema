require_relative '../config'

# this is where you should use an ActiveRecord migration to Create Contacts.

class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.stirng :company, null: false
      t.string :email
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
