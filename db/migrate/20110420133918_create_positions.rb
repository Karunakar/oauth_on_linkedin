class CreatePositions < ActiveRecord::Migration
  def self.up
    create_table :positions do |t|
      t.string :job_tile
      t.integer :profile_id
      t.string :company
      t.string :location
      t.date :start_date
      t.date :end_date
      t.text :description
      t.string :sort_key

      t.timestamps
    end
  end

  def self.down
    drop_table :positions
  end
end
