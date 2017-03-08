class Human
	attr_accessor :health, :strength, :intelligence, :stealth

	def initialize health=100, strength=3, intelligence=3, stealth=3
		@health = health
		@strength = strength
		@intelligence = intelligence
		@stealth = stealth
	end

	def attack obj
		if can_attack(obj)
			obj.health -= 10
			puts 'works'
		else
			puts "doesn't work"
		end
	end

	private
		def can_attack some_obj
			some_obj.class.ancestors.include?(Human)
		end
end

class Wizard < Human
	def initialize
		super
		@health = 50
		@intelligence = 25
		self
	end

	def heal
		@health += 100
	end

	def fireball obj
		obj.health -= 20 if can_attack(obj)
	end
end

class Ninja < Human
	def initialize
		super
		@stealth = 175
		self
	end

	def steal obj
		self.attack obj
		self.health += 10
	end

	def get_away
		self.health -= 15
	end
end

class Samurai < Human
	@@samurai_count = 0
	def initialize
		super
		@health = 200
		self
		@@samurai_count += 1
		puts "Total Number of samurai #{@@samurai_count}"
	end

	def death_blow obj
		self.attack obj
		self.health = 0
	end

	def meditate
		self.health = 200
	end

	def method_name

	end
end


w1 = Wizard.new
s1 = Samurai.new
s2 = Samurai.new
s3 = Samurai.new
n1 = Ninja.new
n1.steal s2
puts n1.health
w1.fireball s1
