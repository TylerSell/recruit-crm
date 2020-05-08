class NewCreateCandidates < ActiveRecord::Migration[6.0]
  def change
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :address_1
      t.string :address_2, :default => nil
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :date_of_birth, :default => nil
      t.string :interview_date, :default => nil
      t.string :test_date, :default => nil
      t.string :stage
      t.boolean :affidavit_sent, :default => false
      t.boolean :affidavit_received, :default => false
      t.boolean :voucher_sent, :default => false
      t.boolean :test_passed, :default => false
      t.boolean :licensed, :default => false
      t.references :agent, foreign_key: false 
      t.references :recruiter, foreign_key: false

      t.timestamps
    end
  end
end
