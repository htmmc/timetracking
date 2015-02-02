class Project < ActiveRecord::Base
	def self.iron_find(id)
		where(id: id).first
	end 
end
