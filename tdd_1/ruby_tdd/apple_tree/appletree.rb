class AppleTree
	attr_accessor :age
	attr_reader :height, :apple_count

	def initialize
		@age = 0
		@height = 1.0
		@apple_count = 0
	end

	def year_gone_by
		@age += 1
		@height = @height * 0.1 + @height

		if @age > 3 && @age <= 10
			@apple_count += 2
		end
	end

	def pick_apples
		@apple_count = 0
	end
end
