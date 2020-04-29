class CreateCandidates < ActiveRecord::Migration[6.0]
  def change
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :date_of_birth
      t.string :interview_date
      t.string :test_date
      t.string :stage
      t.boolean :affidavit_sent
      t.boolean :affidavit_received
      t.boolean :voucher_sent
      t.boolean :test_passed
      t.boolean :licensed
      t.integer :agent_id
      t.integer :recruiter_id

      t.timestamps
    end
  end
end
