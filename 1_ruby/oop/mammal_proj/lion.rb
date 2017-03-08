require_relative "mammal"

class Lion < Mammal
	def initialize
		super 170
		self
	end

	def fly
		@health -= 10
		self
	end

	def attack_town
		@health -= 50
		self
	end

	def eat_humans
		@health += 20
		self
	end

	def display_health
		puts "This is a Lion"
		super
	end
end

l1 = Lion.new.display_health.attack_town.attack_town.attack_town.fly.fly.eat_humans.eat_humans.display_health
