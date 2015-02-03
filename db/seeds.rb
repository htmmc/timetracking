# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Project.create name: 'Ironhack', description: 'Ironhack is a...'
Project.create name: 'Time tracking app'
Project.create name: 'Recipe', description: 'Track favorite recipes'
Project.create name: 'cheesecake', description: 'Authentic Italian cheesecake'
project = Project.create name: 'Waze', description: 'An app that saves my commuting life'
entry = Entry.create project_id: project.id, hours: 1, minutes: 30, comments: 'First entry', date: 30
entry = Entry.create project_id: project.id , hours: 2, minutes: 45, comments: 'Second entry', date: 15
entry = Entry.create project_id: project.id, hours: 3, minutes: 10, comments: 'Third entry', date: 5

