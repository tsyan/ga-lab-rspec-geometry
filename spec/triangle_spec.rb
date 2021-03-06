require 'spec_helper'
require_relative '../lib/triangle'

describe Geometry::Triangle do

	describe '#perimeter' do
		it 'adds the lengths of the sides' do
			triangle = Geometry::Triangle.new(3,4,5)
			expect(triangle.perimeter).to eq 3+4+5
		end
	end

	describe '#area' do
		it 'uses heron\'s formula' do
			triangle = Geometry::Triangle.new(3,4,5)
			expect(triangle.area).to eq 6
		end
	end

	describe '#valid?' do
		it 'returns true if triangle is valid' do
			triangle = Geometry::Triangle.new(3,4,5)
			expect(triangle.valid?).to eq true
		end
	end

	describe '#valid?' do
		it 'returns false if triangle is not valid' do
			triangle = Geometry::Triangle.new(20,1,1)
			expect(triangle.valid?).to eq false
		end
	end

	describe '#angles' do
		it 'returns an array' do
			triangle = Geometry::Triangle.new(3,4,5)
			expect(triangle.angles).to be_an Array
		end
	end

	describe '#angles' do
		it 'returns an array of floating-point numbers' do
			triangle = Geometry::Triangle.new(3,4,5)
			triangle.angles.each do |angle|
				expect(angle).to be_a Float
			end
		end
	end

	describe '#angles' do
		it 'sums to 180 degrees' do
			triangle = Geometry::Triangle.new(3,4,5)
			expect(triangle.angles.inject(0) {|sum, angle| sum + angle}).to be > 179.0
			expect(triangle.angles.inject(0) {|sum, angle| sum + angle}).to be < 181.0 # in case of rounding error
		end
	end

end
