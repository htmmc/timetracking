class EntriesController < ApplicationController
	def index
		@project = Project.find params[:project_id]
		@date = DateTime.now
		@entries = @project.entries_for(@date)
		p @entries
	end
	def new
		@project = Project.find params[:project_id]
		@entry = @project.entries.new
	end
	def create
		@project = Project.find params[:project_id]
		@entry = @project.entries.new(entry_params())
		#@entry.user = User.find(session[:user_id])

		if @entry.save
			flash[:notice] = "Entry created successfully!"
			redirect_to project_entries_path(@project) 
			#action: 'index', controller: 'entries', project_id: @project.id
		else 
			flash.now[:error] = "Entry hasn't been created."
			render 'new'
		end
	end 

	def edit
		@project = Project.find params[:project_id]
		@entry = @project.entries.find params[:id]
	end 

	def update
		@entry = Entry.find(params[:id])
		if @entry.update_attributes entry_params
			redirect_to project_entries_path
		else
			@errors = @entry.errors.full_messages
			render 'edit'
		end
	end

	def destroy
		@project = Project.find params[:project_id]
		@entry = @project.entries.find params[:id]
		@entry.delete
		redirect_to project_entries_path
	end 

	private 
	def entry_params
		params.require(:entry).permit(:hours, :minutes, :date, :comments)
	end

end
