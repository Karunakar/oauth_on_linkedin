class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :member_id
      t.string :location
      t.string :fb_uid 
      t.string :firstname
      t.string :lastname
      t.string :head

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
