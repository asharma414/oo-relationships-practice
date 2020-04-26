require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

bob = User.new('Bob')
barker = User.new('Barker')
elon = User.new('Elon')
tesla = Project.new('Tesla', elon, 5000)
spacex = Project.new('SpaceX', elon, 10000)
bob.back_project(2500, tesla)
barker.back_project(2600, tesla)
barker.back_project(5000, spacex)

binding.pry
0