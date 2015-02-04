class EntriesController < ApplicationController
	def index
		@project = Project.find params[:project_id]
		@date = DateTime.now
		@entries = @project.entries_for(@date)
	end
	def new
		@project = Project.find params[:project_id]
		@entry = @project.entries.new
	end
end
