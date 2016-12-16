require 'calculator'

describe Calculator do



	describe '#initialize' do

		describe '#number_of_arguments_given' do
    	
	    	it 'does not raise an error without any argument' do
	      		expect{ Calculator.new}.not_to raise_error
	    	end

	    	it 'does not raise an error passing in a bool as argument' do
	    		stringify_param = [true, false].sample
	      		expect{ Calculator.new(stringify_param)}.not_to raise_error
	    	end

	    end

		describe 'instance_variable_checks' do

	    	it 'properly set the instance params when initialized without any params' do
	    		test_calc = Calculator.new
	    		memory_instance = test_calc.instance_variable_get( :@memory )
	    		stringify_instance = test_calc.instance_variable_get( :@stringify )
	      		expect(memory_instance).to be_nil
	      		expect(stringify_instance).to be_falsey
	    	end
	    	it 'properly set the instance params when initialized with a param' do
	    		stringify_param = [true, false].sample
	      		test_calc = Calculator.new(stringify_param)
	    		memory_instance = test_calc.instance_variable_get( :@memory )
	    		stringify_instance = test_calc.instance_variable_get( :@stringify )
	      		expect(memory_instance).to be_nil
	      		expect(stringify_instance).to eq(stringify_param)
	    	end
	    end
	end

	describe '#stringify' do

		it 'properly set the output when stringify not provided' do
			@test_calc = Calculator.new
			expect(@test_calc.output(2)).not_to be_a(String)
		end

		it 'properly set the output as string when stringify set' do
			@test_calc = Calculator.new(true)
			expect(@test_calc.output(12)).to be_a(String)
		end

		it 'properly set the output when stringify not set' do
			@test_calc = Calculator.new(false)
			expect(@test_calc.output(50)).not_to be_a(String)
		end
	end

	describe 'main functionality' do

		before do
			@test_calc = Calculator.new
		end
	
		describe '#add' do
			
	    	it 'returns the sum of its positive integer arguments' do
	      		expect(@test_calc.add(1, 2)).to eq(3)
	    	end

	    	it 'returns the sum of its arguments when one is negative' do
	      		expect(@test_calc.add(-10, 7)).to eq(-3)
	    	end

	    	it 'returns the sum of its arguments when they are float' do
	    		first_arg = 3.53
	    		second_arg = 8.64
	      		expect(@test_calc.add(first_arg, second_arg)).to be_within(0.01).of(12.17)
	    	end

	    	it "can add very big numbers" do
				first_arg = 8972348972348
	    		second_arg = 90544564353
	      		expect(@test_calc.add(first_arg, second_arg)).to eq(8972348972348+90544564353)
	    	end
	  	end

	  	describe '#subtract' do
			
	    	it 'returns the subtract of its positive integer arguments' do
	      		expect(@test_calc.subtract(1, 2)).to eq(-1)
	    	end

	    	it 'returns the subtract of its arguments when first one is negative' do
	      		expect(@test_calc.subtract(-11, 3)).to eq(-14)
	    	end

	    	it 'returns the subtract of its arguments when second one is negative' do
	      		expect(@test_calc.subtract(10, -7)).to eq(17)
	    	end

	    	it 'returns the subtract of its arguments when both are negative' do
	      		expect(@test_calc.subtract(-3, -7)).to eq(4)
	    	end

	    	it 'returns the subtract of its arguments when they are both floats' do
	    		first_arg = -3.53
	    		second_arg = -8.64
	      		expect(@test_calc.subtract(first_arg, second_arg)).to be_within(0.01).of(5.11)
	    	end

	    	it "can subtract very big numbers" do
				first_arg = 8972348972348
	    		second_arg = 90544564353
	      		expect(@test_calc.subtract(first_arg, second_arg)).to eq(8972348972348-90544564353)
	    	end
	  	end

	  	describe '#multiply' do
			
	    	it 'returns the multiply of its positive integer arguments' do
	      		expect(@test_calc.multiply(5, 6)).to eq(30)
	    	end

	    	it 'returns the multiply of its arguments when first one is negative' do
	      		expect(@test_calc.multiply(-11, 3)).to eq(-33)
	    	end

	    	it 'returns the multiply of its arguments when second one is negative' do
	      		expect(@test_calc.multiply(10, -7)).to eq(-70)
	    	end

	    	it 'returns the multiply of its arguments when both are negative' do
	      		expect(@test_calc.multiply(-3, -7)).to eq(21)
	    	end

	    	it 'returns the multiply of its arguments when they are both floats' do
	    		first_arg = -3.53
	    		second_arg = 8.64
	      		expect(@test_calc.multiply(first_arg, second_arg)).to be_within(0.01).of(-30.49)
	    	end

	    	it "can multiply very big numbers" do
				first_arg = 8972348972348
	    		second_arg = 90544564353
	      		expect(@test_calc.multiply(first_arg, second_arg)).to eq(8972348972348*90544564353)
	    	end
	  	end

	  	describe '#divide' do

			it 'throws an error if divided by zero' do
	      		expect{ @test_calc.divide(9,0)}.to raise_error(ArgumentError)
	    	end
			
	    	it 'returns a positive integer when there is no remainder with positive integer arguments' do
	      		expect(@test_calc.divide(77, 11)).to eq(7)
	    	end

	    	it 'returns a positive integer when there is no remainder with negative, positive integer arguments' do
	      		expect(@test_calc.divide(-12, 3)).to eq(-4)
	    	end

	    	it 'returns a positive integer when there is no remainder with positive, negative integer arguments' do
	      		expect(@test_calc.divide(10, -2)).to eq(-5)
	    	end

	    	it 'returns a positive integer when there is no remainder with negative integer arguments' do
	      		expect(@test_calc.divide(-30, -6)).to eq(5)
	    	end

	    	it 'returns an integer when there is no remainder with 2 floats' do
	    		first_arg = -4.42
	    		second_arg = 2.21
	      		expect(@test_calc.divide(first_arg, second_arg)).to be_within(0.01).of(-2)
	    	end

	    	it 'returns a float when there is remainder with 2 floats' do
	    		first_arg = -4.41
	    		second_arg = 2.21
	      		expect(@test_calc.divide(first_arg, second_arg)).to be_within(0.01).of(-2.0)
	    	end

	    	it "can divide very big numbers" do
				first_arg = 8972348972348
	    		second_arg = 90544564353
	      		expect(@test_calc.divide(first_arg, second_arg)).to be_within(0.01).of(8972348972348.0/90544564353.0)
	    	end
	  	end

	  	describe '#pow' do
			
			it "can calculate a positive integer power of a number" do
				first_arg = 11
	    		second_arg = 2
	      		expect(@test_calc.pow(first_arg, second_arg)).to eq(121)
			end
			
			it "can calculate large values" do
				first_arg = 5
	    		second_arg = 7
	      		expect(@test_calc.pow(first_arg, second_arg)).to eq(5**7)
			end

			it "can calculate negative powers" do
				first_arg = 5
	    		second_arg = -7
	      		expect(@test_calc.pow(first_arg, second_arg)).to eq(5**-7)
			end

			it "can calculate decimal powers" do
				first_arg = 6
	    		second_arg = 1.7
	      		expect(@test_calc.pow(first_arg, second_arg)).to eq(6**1.7)
			end
	  	end

	  	describe '#sqrt' do
		
			it "can calculate sqr root of a positive integer" do
				first_arg = 225
	      		expect(@test_calc.sqrt(first_arg)).to eq(15)
			end

			it "can calculate sqr root of a positive integer in 2 decimal digits" do
				first_arg = 224
	      		expect(@test_calc.sqrt(first_arg)).to be_within(0.1).of(15)
			end
			
			it "throws error if argument is negative" do
				first_arg = -5
	      		expect{@test_calc.sqrt(first_arg)}.to raise_error(ArgumentError)
			end
	  	end

	  	describe '#memory' do
	  		it "setter, overrides previous object in memory" do
	  			before_memory_instance = @test_calc.memory
	  			@test_calc.memory = 25
	  			after_memory_instance = @test_calc.memory
	  			expect(before_memory_instance).not_to eq(after_memory_instance)
	  		end

	  		it "getter, returns the memory object" do
	  			@test_calc.memory = 13
				memory_instance = @test_calc.memory
				expect(memory_instance).to eq(13)
	  		end

	  		it "getter, clears the memory" do
	  			@test_calc.memory = 13
				memory_instance = @test_calc.memory
				memory_instance = @test_calc.memory
				expect(memory_instance).to be_nil
	  		end
	  	end
	  end
end