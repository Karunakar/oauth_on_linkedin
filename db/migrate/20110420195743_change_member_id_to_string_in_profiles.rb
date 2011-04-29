class ChangeMemberIdToStringInProfiles < ActiveRecord::Migration
  def self.up
    change_column :profiles, :member_id, :string
  end

  def self.down
    change_column :profiles, :member_id, :integer
  end
end
