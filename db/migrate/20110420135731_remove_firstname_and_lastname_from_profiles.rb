class RemoveFirstnameAndLastnameFromProfiles < ActiveRecord::Migration
  def self.up
    remove_column :profiles, :firstname
    remove_column :profiles, :lastname
  end

  def self.down
    add_column :profiles, :lastname, :string
    add_column :profiles, :firstname, :string
  end
end
