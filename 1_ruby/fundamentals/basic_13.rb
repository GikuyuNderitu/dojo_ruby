# 1.
(1..255).each {|n| puts n}

#2.
puts (1..255).find_all {|n| n % 2 != 0}

# 3.
sum = 0
(1..255).each {|n| sum += n; puts "New number #{n} Sum: #{sum}"}

# 4.
arr = [1,4,12,	2,3,5,689,1239,123,329,23,1]
arr.each {|n| puts n}

#5
puts arr.max

#6
puts arr.collect.reduce(:+) / arr.size

#7
puts arr.delete_if{|n| n % 2 == 0}

# 8.
def greater_than_y (arr, y)
	arr.delete_if{|n| n <= y}
end
puts "\n", greater_than_y([1,34,102,23,239,3,5,490], 49)

# 9.
puts "\n", arr.map {|n| n*n}

# 10.
puts "\n", [-1,30,-349,10,304].map{|n|
	if n < 0
		n = 0
	end
	n
}

# 11.
puts "\n"
narr = [23,38,123,12,23,85,40000, -238]
min = narr.collect.min
max = narr.collect.max
avg = narr.collect.reduce(:+) / narr.size
puts min, max, avg

# 12. Shift to the front
sarr = [0,1,2,3,4,5]
puts "\n"
puts sarr[1,sarr.size-1] << sarr[0]

#13. Num to String
puts "\n"
def dojofy arr
	arr.map {|n| if n < 0
		n = 'Dojo'
	end
	n
}
end
puts dojofy([-1,3,48,-3894,84,-48])
