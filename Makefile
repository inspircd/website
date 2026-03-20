build: clean deps
	bundle exec jekyll build

clean:
	rm -rf _site

deps:
	bundle install

serve: clean deps
	bundle exec jekyll serve
