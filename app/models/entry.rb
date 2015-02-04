class Entry < ActiveRecord::Base
	belongs_to :project

	validates :hours, numericality: true
	validates :date, presence: true
	validates :hours, presence: true
	validates :minutes, presence: true
	validates_associated :project
	
end
