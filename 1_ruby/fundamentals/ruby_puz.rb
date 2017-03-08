# 1.
arr1 = [3,5,1,2,7,9,8,13,25,32]
def largest arr
	arr.reduce(0) {|memo ,n|
		puts memo + n
		memo + n
	}
	puts "\n"
	arr.reject {|n| n < 10}
end

puts largest arr1


# 2.
puts "\n"
arr2 = ['John', 'KB', 'Oliver', 'Cory', 'Matthew', 'Christopher']
def do_shuffle arr
	narr = arr.shuffle.each {|n| puts n}.reject {|n| n.length < 5}
	puts "\n"
	narr
end
puts do_shuffle arr2

# 3.
def shuff_alpha arr
	narr = arr.shuffle
	if /a|e|i|o|u/.match(narr[0])
		puts "The vowel message goes here"
	end
	puts narr[0]

	puts narr[narr.size-1]
end

shuff_alpha ('a'..'z').to_a

# 4.
puts "\n"
def rand_55_100
	narr = []
	(1..10).each do narr << rand(55..100) end
	return narr
end

puts rand_55_100

# 5.
puts "\n"
def sort_min_max arr
	narr = arr.sort
	puts narr, "\t", narr.max, "\t", narr.min

end

sort_min_max rand_55_100

# 6
puts "\n"
def random_5_str
	return (1..5).reduce("") {|memo , n| memo + (65+rand(26)).chr}
end

puts random_5_str

# 7
puts "\n"
puts (1..10).reduce([]) {|memo, n| memo << random_5_str}
