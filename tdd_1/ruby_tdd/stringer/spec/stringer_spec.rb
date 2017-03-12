require "spec_helper"

RSpec.describe Stringer do
	it "has a version number" do
		expect(Stringer::VERSION).not_to be nil
	end

	it "does something useful" do
		expect(true).to eq(true)
	end

	it "concatenates undefined number of strings with a space" do
		expect(Stringer.spacify "Oscar", "Vazquez", "Zweig", "Olasaba", "Hernandez", "Ricardo", "Mendoza").to eq("Oscar Vazquez Zweig Olasaba Hernandez Ricardo Mendoza")
	end

	it "shortens a string to the required length if required" do
		expect(Stringer.minify "Hello, I'm learning how to create a gem", 10).to eq("Hello, I'm...")
		expect(Stringer.minify "Hello", 10).to eq("Hello")
	end

	it "iterates over a string and replaces each instance of a given word with a given replacement word" do
		expect(Stringer.replacify("I can't do this", "can't", "can")).to eq("I can do this")
	end

	it "iterates over string and adds each word to an array" do
		expect(Stringer.tokenize("I love to code")).to eq(["I", "love", "to", "code"])
	end

	it "removes each instance of the second parameter within a given string (first parameter)" do
		expect(Stringer.removify("I'm not a developer", "not")).to eq("I'm a developer")
	end
end
