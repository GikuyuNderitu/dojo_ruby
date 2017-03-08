class MathDojo
	attr_accessor :value
	def initialize value = 0.0
		@value = value
		return self
	end

	def add *params
		puts params.inspect
		@value = params.flatten.reduce(@value) {|memo, param| memo + param}
		# puts value
		return self
	end

	def subtract *params
		puts params.inspect
		@value = params.flatten.reduce(@value) {|memo, param| memo - param.to_f}
		# puts @value
		return self
	end

	def result
		return @value
	end
end
challenge1 = MathDojo.new.add(2).add(2, 5).subtract(3, 2).result
challenge2 = MathDojo.new.add(1).add([3, 5, 7, 8], [2, 4.3, 1.25]).subtract([2,3], [1.1, 2.3]).result

puts "\n\n #{challenge1} \n\n #{challenge2}"
