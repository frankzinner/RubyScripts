class Haushaltskonto

	@cvsfile

	def initialize(file = nil)
		@cvsfile = file
	end

	def getFilename
		return @cvsfile
	end

	def load
		line = ""
		return "" if @cvsfile == nil
		f = File.new(@cvsfile, "r")
		f.readlines.each do |l|
			line += l
		end
		return line
	end

	def readDateHeader
		f = File.new(@cvsfile, "r")
		l = f.readline
		return l.gsub(/"/,'').split(/;/).to_s
	end

end
