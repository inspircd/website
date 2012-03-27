# ==============================================================================
# InspIRCd Website (C) 2012 InspIRCd Development Team
# ==============================================================================
# This program is free but copyrighted software; see the file LICENSE.txt for
# details.
# ==============================================================================

require 'rubygems' if RUBY_VERSION < '1.9'
require 'rake'

# Helpers
def ask(message)
	print message
	return STDIN.gets.chomp
end

def download(uri)
	require 'uri'
	require 'net/https'
	uri = URI.parse(uri)
	http = Net::HTTP.new(uri.host, uri.port)
	http.use_ssl = (uri.port == 443)
	http.verify_mode = OpenSSL::SSL::VERIFY_NONE
	request = Net::HTTP::Get.new(uri.request_uri)
	response = http.request(request)
	return response.body
end

def template(source, *variables)
	require 'erubis'
	input = File.read(source)
	eruby = Erubis::Eruby.new(input)
	return eruby.evaluate(*variables)
end

# Tasks
task :default do
	print `rake --tasks`
end

desc 'Create a new post template (requires Erubis)'
task :post do
	author = ENV['USER'] || ENV['USERNAME']
	title = ask('Post title: ')
	result = template('_templates/post.erb', :author => author, :title => title)
	slug = title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, nil.to_s)
	date = Time.now.strftime('%Y-%m-%d')
	destination = "_posts/#{date}-#{slug}.md"
	File.open(destination, 'w') do |file|
		file.write(result)
	end
	editor = ENV['EDITOR'] || 'nano'
	system "#{editor} #{destination}"
end

desc 'Launch preview environment (requires Jekyll)'
task :preview do
	system "jekyll --auto --server"
end

desc 'Update third party resources (requires OpenSSL)'
task :update do
	puts 'Updating third party resources..'
 	resources = {
		'https://raw.github.com/necolas/normalize.css/master/normalize.css' => 'assets/stylesheets/normalize.css',
		'http://www.modernizr.com/downloads/modernizr-latest.js' => 'assets/javascripts/modernizr.js'
	}.freeze
	resources.each do |source, target|
		source_contents = download(source)
		target_contents = File.exist?(target) ? File.read(target) : nil.to_s
		if source_contents != target_contents
			puts "Updated #{target}!"
			File.open(target, 'w') do |file|
				file.write(source_contents)
			end
		end
	end
	print 'Update complete.'
end