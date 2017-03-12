require "stringer/version"

module Stringer
	def self.spacify *strings
		string = ""
		strings.each_with_index do |s, idx|
			if idx == 0
				string += s
			else
				string += " " + s
			end
		end
		string
	end

	def self.minify string, max
		if string.length <= max
			return string
		end

		nstr = ""

		string.split("").each_with_index do |char, idx|
			if idx < max
				nstr += char
			else
				nstr+= "..."
				break
			end
		end
		nstr
	end

	def self.replacify orig, to_replace, replacement
		nstr = []
		orig.split(" ").each do |word|
			replace = word
			if word == to_replace
				replace = replacement
			end
			nstr << replace
		end
		puts nstr
		orig = nstr.join(' ')
		orig
	end

	def self.tokenize string
		string.split(" ")
	end

	def self.removify string, to_remove
		nstr = []
		string.split(" ").each do |word|
			if word != to_remove
				nstr << word
			end
		end
		nstr.join(" ")
	end
end
