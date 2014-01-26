source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '2.3.18' 

# bundler requires these gems in all environments 
# gem 'nokogiri', '1.4.2' 
# gem 'geokit'  

group :development do 
# bundler requires these gems in development 
# gem 'rails-footnotes' 
gem 'sqlite3-ruby', '1.2.5', :require => 'sqlite3'
end  

group :test do 
# bundler requires these gems while running tests 
# gem 'rspec' # gem 'faker' 
gem 'test-unit', '1.2.3'
gem "factory_girl",'1.2.3'
gem 'nokogiri', '1.6.1'
gem 'rack_session_access', '0.1.1'
gem 'rack-test', '0.6.2'
end

group :production do
	gem 'pg', '0.12.2'
end
