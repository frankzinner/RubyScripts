require "Haushaltskonto"
require "test/unit"

class HaushaltskontoTest < Test::Unit::TestCase

	@filename
	@instance

	def setup
		#@filename = File.expand_path('~/Projects/RubyScripts/tests/TESTFILE.CVS')
		@filename = File.expand_path('~/Projects/RubyScripts/tests/Umsatzanzeige.csv')
		@instance = Haushaltskonto.new(@filename)
	end

	def teardown
		@instance = nil
	end

	def test_can_create_class_Haushaltskonto
		assert_not_nil(Haushaltskonto.new, "Klasse Haushaltskonto kann erzeugt werden")
	end

	def test_can_create_class_Haushaltskonto_with_filename
		@instance = Haushaltskonto.new(@filename)
		assert_equal(@filename, @instance.getFilename, "Übergebener Parameter stimmt überein")
	end

	def test_can_load_file
		assert_match(/"Umsatzanzeige vom ";"27.01.2013 15:46"/, @instance.load)
		assert_match("", Haushaltskonto.new.load)
	end

	def test_can_read_header
		header = @instance.readDateHeader
		assert_match(/Umsatzanzeige vom \d\d\.\d\d\.\d\d\d\d \d\d:\d\d/, header)
	end

end
