require File.dirname(__FILE__) + '/../Build'
require "test/unit"

class MyTest < Test::Unit::TestCase

	# Called before every test method runs. Can be used
	# to set up fixture information.
	def setup
		# Do nothing
	end

	# Called after every test method runs. Can be used to tear
	# down fixture information.

	def teardown
		# Do nothing
	end

	def test_get
		#fail("Not implemented")
		assert_equal('test', Build.new('test').get, 'Getting proper value failed®')
	end
end
