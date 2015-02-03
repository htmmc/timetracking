class Project < ActiveRecord::Base
	def self.iron_find(id)
		where(id: id).first
	end 
	def self.clean_old
		Project.where("created_at < ?", 1.week.ago).destroy_all
	end 
	def self.last_created_projects(n)
		Project.order("created_at DESC").limit(n)
	end 
end
