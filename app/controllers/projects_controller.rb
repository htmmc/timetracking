class ProjectsController < ApplicationController
	def index
		#@projects = Project.order(created_at: :desc).limit(10)
		@projects = Project.last_created_projects(10)
	end 
	def show
		unless @project = Project.find_by(id: params[:id])
		render 'no_projects_found'
		end
	end 
end
