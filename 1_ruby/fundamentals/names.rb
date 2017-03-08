a = {first_name: "Michael", last_name: "Choi"}
b = {first_name: "John", last_name: "Doe"}
c = {first_name: "Jane", last_name: "Doe"}
d = {first_name: "James", last_name: "Smith"}
e = {first_name: "Jennifer", last_name: "Smith"}
names = [a, b, c, d, e]

def say_names arr
	puts "You have #{arr.size} names in the 'names' array"
	puts arr.map {|val| "This name is '#{val[:first_name] + " " + val[:last_name]}'."}
end

say_names names
