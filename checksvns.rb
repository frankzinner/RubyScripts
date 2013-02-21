class Checksvns

  attr_accessor :path
  attr_accessor :svnrepositories

  def initialize
    @path = "Z:\\www\\_dev-fzi\\"
    @svnrepositories = [
        @path + "APPLICATIONS\\lisa\\trunk",
        @path + "APPLICATIONS\\alps\\trunk",
        @path + "CMP\\trunk"
    ]
  end

  def svnupdate
    @svnrepositories.each do |svnrepo|
      puts "update repository " + svnrepo
      result = `svn up #{svnrepo}`
      puts result
    end
  end

end

Checksvns.new.svnupdate