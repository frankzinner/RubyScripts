=begin
 Description:	This is a Rake helper file to create some directories if they dont exists.
 Author: 	Frank Zinner
=end
$RAKEFILEPATH = File.dirname(__FILE__)

EXCLUDELIST = %w[/*.test.*/]

task :default => [:info]

desc "This is the default task <info> witch does nothing"
task :info do
	puts "This is the default task"
end

SUPITELEKOMPATH = %w[./supi-telekom/]
desc "List known directories for processing"
task :list do
	SUPITELEKOMPATH.each { |g| puts g }
end

desc "Create directories"
task :create do
	SUPITELEKOMPATH.each do |f|
    sh "rm -r #{f}" if File.directory?(f)
    mkdir "#{f}" if not File.directory?(f)
    sh "chown wwwrun:www #{f}" if File.directory?(f)
    sh "chmod 775 #{f}" if File.directory?(f)
  end
end

desc "Delete created directories"
task :delete do
	SUPITELEKOMPATH.each { |f| sh "rm -r #{f}" if File.directory?(f) }
end

desc "Find external used libraries"
task :findExternalLibs do
	cmdresult =  `find . -name '*.js'`
	if '/nicht gefunden/'.match(cmdresult)
		puts "Es konnten keine relevanten Dateien gefunden werden!"
	else
		cmdresult.to_a.each do |result|
			if /\/trunk\//.match(result) then
				puts result
			end
		end
	end
end

desc "Counting lines of code"
task :countln do
	WORKINGDIR = File.dirname(__FILE__) + '/APPLICATIONS/lisa/trunk/LISA-MODS/4901/'
	WORKINGDIR2 = File.dirname(__FILE__) + '/APPLICATIONS/lisa/inbox.refactoring/LISA-MODS/4901/'
	PATH = %w[
		 page.inboxstart/x/page.inboxstart.js
		 mailwriteview/x/mod.mailwriteview.js
		 mailreadview/x/mod.mailreadview.js
		 xmswriteview/x/mod.xmswriteview.js
		 messagelist/x/mod.messagelist.js
	]

	PATH.each do |f|
		sh "wc -l #{WORKINGDIR}#{f}"
		sh "wc -l #{WORKINGDIR2}#{f}"
	end
end

desc "Convert line endings to unix"
# LF (U+000A) \n = Unix
# CR+LF (U+000D U+000A) \r\n = Windows
task :convert2Unix do
	WORKSPACE = File.dirname(__FILE__) + '/trunk/'
	fileList = FileList.new(WORKSPACE + '**/*.php', WORKSPACE + '**/*.js') do |flist|
		flist.exclude(/.*test.*/i)
		flist.exclude(/.*rte.*/i)
		flist.exclude(/.*builds.*/i)
	end
	#puts fileList
	fileList.each do |entry|
		#content = IO.read(entry)
		#puts content.gsub(//, '')
		#sh "grep -e '/\r\n/' #{entry}"
		return
	end
end
