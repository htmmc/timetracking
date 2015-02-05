class UserMailer < ActionMailer::Base
	default from: "from@example.com"

	def entry_created(project)
		@project = project
		mail(to: 'hitomi.mzgk@gmail.com', subject: "New entry created in project #{project.name}")	
		#mail is an instance method of ActionMailer Base & takes a hash of argument
	end
end
