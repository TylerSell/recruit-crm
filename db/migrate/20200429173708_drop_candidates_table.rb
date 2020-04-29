class DropCandidatesTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :candidates
  end
end
