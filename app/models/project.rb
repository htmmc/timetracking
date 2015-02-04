
class Project < ActiveRecord::Base
	has_many :entries
	
	validates :name, uniqueness: true
	validates :name, presence: true
	validates :name, length: {maximum: 30}
	validates :name, format: {with: /\w/}

	def self.iron_find(id)
		where(id: id).first
	end 
	def self.clean_old
		Project.where("created_at < ?", 1.week.ago).destroy_all
	end 
	def self.last_created_projects(n)
		Project.order("created_at DESC").limit(n)
	end 
	def entries_for(date)
		entries.where(date: date.beginning_of_month..date.end_of_month)
	end
	def total_hours_in_month(month, year)
		date = DateTime.new(year, month)
		es = entries_for(date)
		hours = 0;
		minutes = 0;
		es.each do |entry| 
			hours += entry.hours
			minutes +=entry.minutes
		end
		(minutes/60) + hours 
	end
end
