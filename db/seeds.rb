# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
require 'nokogiri'
require 'open-uri'

# Maybe add some sanitizing for our data before entering it to the database...
doc = Nokogiri::HTML(open('http://www.cs.helsinki.fi/opinnot/syksy09opetus.html'))
puts 'Seeding database with new course data:'
Course.destroy_all

doc.css('h2 > a').each do |link|
  puts link.content
  Course.create(:name => link.content, :description => 'Lorem ipsum ' * 10)
end