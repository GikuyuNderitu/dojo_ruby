class Project
	attr_accessor :name, :elevator_pitch, :description
	attr_reader :owner, :tasks

	def elevator_pitch
		return @name + ', ' + @description
	end
end

# project1 = Project.new("Project", "Description 1")
# puts project1.name
# puts project1.elevator_pitch
