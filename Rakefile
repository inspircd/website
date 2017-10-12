#
# InspIRCd -- Internet Relay Chat Daemon
#
#   Copyright (C) 2012 Peter Powell <petpow@saberuk.com>
#
# This file is part of InspIRCd.  InspIRCd is free software: you can
# redistribute it and/or modify it under the terms of the GNU General Public
# License as published by the Free Software Foundation, version 2.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

require 'rubygems' if RUBY_VERSION < '1.9'
require 'rake'

task :default do
	system $PROGRAM_NAME, '--tasks'
end

desc 'Create a new post'
task :post do
	print 'Post title: '
	title = STDIN.gets.chomp
	author = ENV['USER'] || ENV['USERNAME'] || 'Anonymous Coward'
	template = File.read('_templates/post.md')
	template.gsub!('<<title>>', title)
	template.gsub!('<<author>>', author)
	slug = title.downcase.gsub(' ', '-').gsub(/[^\w-]/, '')
	date = Time.now.strftime('%Y-%m-%d')
	destination = "_posts/#{date}-#{slug}.md"
	File.open(destination, 'w') do |file|
		file.write(template)	
	end
	editor = ENV['EDITOR'] || 'nano'
	system editor, destination
end
