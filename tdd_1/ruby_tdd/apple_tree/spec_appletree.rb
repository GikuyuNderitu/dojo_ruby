require_relative "appletree"

RSpec.describe AppleTree do
	before(:each) do
		@a1 = AppleTree.new
	end

	it "has an age attribute with getter and setter methods" do
		@a1.age = 1
		expect(@a1.age).to eq(1)
	end

	it "has a height attribute with only a getter method. You should raise a NoMethodError if anyone tries to set the height attribute directly" do
		expect(@a1.height).to eq(1.0)
		expect{@a1.height = 2}.to raise_error(NoMethodError)
	end

	it "has an apple count attribute with only a getter method" do
		expect(@a1.apple_count).to eq(0)
		expect{@a1.apple_count = 40}.to raise_error(NoMethodError)
	end

	it "has a year_gone_by method that functions correctly" do
		@a1.year_gone_by
		expect(@a1.age).to eq(1)
		expect(@a1.height).to eq(1.1)
		expect(@a1.apple_count).to eq(0)
		@a1.age = 3
		@a1.year_gone_by
		expect(@a1.apple_count).to eq(2)
	end

	it "has method pick apples that takes all of the apples off of the tree" do
		@a1.age = 3
		@a1.year_gone_by
		@a1.year_gone_by
		@a1.year_gone_by
		@a1.year_gone_by
		expect(@a1.apple_count).to eq(8)
		@a1.pick_apples
		expect(@a1.apple_count).to eq(0)
	end

	context "Turning 4 years old" do
		before(:each) do
			@a1 = AppleTree.new
			@a1.age = 2
		end

		it "can grow apples" do
			expect(@a1.apple_count).to eq(0)
			@a1.year_gone_by
			@a1.year_gone_by

			expect(@a1.apple_count).to eq(2)
		end
	end

	context "is under 3 years old" do
		before(:each) do
			@a1 = AppleTree.new
		end

		it "can't grow apples" do
			@a1.year_gone_by
			expect(@a1.apple_count).to eq(0)
		end
	end

	context "is older than 10" do
		before(:each) do
			@a1 = AppleTree.new
			@a1.year_gone_by
			@a1.year_gone_by
			@a1.year_gone_by
			@a1.year_gone_by
			@a1.year_gone_by
			@a1.year_gone_by
			@a1.year_gone_by
			@a1.year_gone_by
			@a1.year_gone_by
			@a1.year_gone_by
		end

		it "can't grow apples because it is older than 10" do
			expect(@a1.apple_count).to eq(14)
			@a1.year_gone_by
			expect(@a1.apple_count).to eq(14)
		end
	end
end
