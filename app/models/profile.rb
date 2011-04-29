class Profile < ActiveRecord::Base
  has_many :positions

  def self.create_profile(current_user)
    profile = Profile.find_or_create_by_member_id_and_name_and_location_and_head(current_user["id"],Profile.username(current_user),Profile.location(current_user["location"]), current_user['headline'])
    Position.add(current_user["positions"], profile)
  end

  #TO DO - Need to think about correct place methods
  def self.username(current_user)
    current_user["firstName"]  + " " + current_user["lastName"]
  end

  def self.location(location)
    location["name"] + ", " +location["country"]["code"]
  end

end
