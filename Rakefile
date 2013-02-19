# Rake file for various cases
# Author:	Frank Zinner

desc "Default task - runs when no task was specified"

task :default => [:test]

desc "A rake test task"
task :test do
	puts "Hello from rake ..."
end

desc "List known directories for processing"
task :list do
	PATH = %w[
		./supi-telekom/
		./frankzinner/
	]
	PATH.each { |g| puts g }
end

desc "Cleanup directories"
task :cleanup do
	PATH = %w[
		./supi-telekom/
		./frankzinner/
	]
	PATH.each do |f|
		sh "rm -r #{f}" if File.directory?(f)
		mkdir "#{f}" if not File.directory?(f)
		sh "chown wwwrun:www #{f}" if File.directory?(f)
		sh "chmod 775 #{f}" if File.directory?(f)
	end
end

desc "Counting lines of code"
task :countln do
	WORKINGDIR = File.dirname(__FILE__) + '/APPLICATIONS/LISA/trunk/LISA-MODS/4901/'
	WORKINGDIR2 = File.dirname(__FILE__) + '/APPLICATIONS/LISA/inbox.refactoring/LISA-MODS/4901/'
	PATH = %w[
	 ./page.inboxstart/x/page.inboxstart.js
	 ./mailwriteview/x/mod.mailwriteview.js
	 ./mailreadview/x/mod.mailreadview.js
	 ./xmswriteview/x/mod.xmswriteview.js
	 ./messagelist/x/mod.messagelist.js
	]
	PATH.each do |f|
		sh "wc -l #{WORKINGDIR}#{f}"
		sh "wc -l #{WORKINGDIR2}#{f}"
	end
end
