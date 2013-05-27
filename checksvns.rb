class CheckSVN 

    attr_accessor :path
    attr_accessor :svnrepositories
    @@singlepath = nil
    
    def initialize
        @path = []
        @svnrepositories = []
    end

    def svnupdate
        @path.each do |p|
            @singlepath = p
            @svnrepositories.each do |svnrepo|
                fullrepository = @singlepath + svnrepo
                puts "update repository " + fullrepository
                puts  `svn up #{fullrepository}`
        end
    end

end

class ChecksvnLISA < CheckSVN

    def initialize
        @path = [
            "W:\\_dev-fzi\\"
        ]
        @svnrepositories = [
            "APPLICATIONS\\lisa\\trunk",
            "APPLICATIONS\\alps\\trunk",
            "CMP\\trunk"
        ]
    end

end

class ChecksvnLR < CheckSVN

    def initialize
        @path = [
            "C:\\Projects\\",
            "E:\\"
        ]
        @svnrepositories = [
            "LR\\trunk\\lr-ci",
            "LR\\trunk\\lr-core",
            "LR\\trunk\\lrph-admin",
            "LR\\trunk\\lrph-payment",
            "LR\\trunk\\lrph-web"
        ]
    end
       
end

ChecksvnLR.new.svnupdate
ChecksvnLISA.new.svnupdate

end