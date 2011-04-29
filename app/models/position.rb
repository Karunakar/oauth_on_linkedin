class Position < ActiveRecord::Base
  belongs_to :profile
  def self.add(positions, profile)
    positions["values"].each do |position|
	logger.info position.inspect
      new_position = Position.find_or_create_by_profile_id_and_company_and_id_and_job_tile(profile.id,position["company"]["name"],position["id"],position["title"])
      new_position.update_attributes(:description => position["summary"],:start_date => Position.date(position['startDate']),
        :end_date => Position.date(position['endDate']),:location => position["location"])
    end
  end

  #To DO: Move this code to active model or specific class
  def self.date(date_hash)
    unless date_hash.blank?
	unless date_hash['month'].blank?
      		Date.new(date_hash['year'].to_i,date_hash['month'].to_i )
	else

      		Date.new(date_hash['year'].to_i)
	end
    end
  end
end
