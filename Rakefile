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
	system($PROGRAM_NAME, '--tasks')
end

desc 'Minify the site resources'
task :minify do
	begin
		Gem::Specification.find_by_name('yui-compressor')
		require 'yui/compressor'
	rescue Gem::LoadError
		puts 'You are missing the yui-compressor gem. Install it using:'
		puts "\t$ [sudo] gem install yui-compressor"
		exit 1
	end
	Dir['assets/{javascripts,stylesheets}/*.min.{css,js}'].each do |asset|
		File.delete(asset)
		puts "Purged #{asset}!"
	end		
	Dir['assets/{javascripts,stylesheets}/*.{css,js}'].each do |asset|
		compressor = File.extname(asset) == '.css' ? YUI::CssCompressor.new : YUI::JavaScriptCompressor.new
		minified_source = compressor.compress(File.read(asset))
		File.open(asset.gsub('.', '.min.'), 'w') do |file|
			file.write(minified_source)
		end
		puts "Minified #{asset}!"
	end	
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

desc 'Update the third party resources'
task :update do
	require 'net/http'
	require 'uri'
	resources = {
		'https://raw.githubusercontent.com/aFarkas/html5shiv/master/dist/html5shiv.js' => 'assets/javascripts/html5shiv.js',
		'https://raw.githubusercontent.com/necolas/normalize.css/master/normalize.css' => 'assets/stylesheets/normalize.css',
	}.freeze
	resources.each do |source, target|
		uri = URI.parse(source)
		http = Net::HTTP.new(uri.host, uri.port)
		http.use_ssl = true if uri.scheme == "https"
		response = http.get(uri.path)
		if response.code == '200'
			target_contents = File.read(target)
			if target_contents != response.body
				File.open(target, 'w') do |file|
					file.write(response.body)
				end
				puts "Updated #{target}!"
			end
		else
			puts "Warning: #{source} returned HTTP #{response.code}: #{response.message}!"	
		end  	
	end
end
