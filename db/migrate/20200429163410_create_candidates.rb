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
      t.boolean :affidavit_sent, :default => false
      t.boolean :affidavit_received, :default => false
      t.boolean :voucher_sent, :default => false
      t.boolean :test_passed, :default => false
      t.boolean :licensed, :default => false
      t.integer :agent_id, :null => false
      t.integer :recruiter_id, :null => false
      t.belongs_to :agent, foreign_key: true
      t.belongs_to :recruiter, foreign_key: true

      t.timestamps
    end
  end
end
