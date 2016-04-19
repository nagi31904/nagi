# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Bookmark.create( :name => "Home" )
Bookmark.create( :name => "News" )
Bookmark.create( :name => "Work" )
Bookmark.create( :name => "Abouts" )
Bookmark.create( :name => "Blog" )
Work_category.create(:title => "illustration")
User.create(:email =>"nagi31904@gmail.com",:encrypted_password=>"king31904",:first_name=>"nagi",:last_name=>"chiang",:admin=>true)