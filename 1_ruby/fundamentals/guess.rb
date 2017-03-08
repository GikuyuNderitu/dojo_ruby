def guess_number(guess)
	number = 25
	unless guess <= number
		return "Guessed too high."
	end

	unless guess >= number
		return "Guessed too low."
	else
		return "Jusst Right!"
	end
end


puts guess_number(24)
puts guess_number(26)
puts guess_number(25)
