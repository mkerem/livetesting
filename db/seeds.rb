# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

locations = ["ITS (Rush Rhees Library)",                        
"Southside",                                       
"Riverview Apartments",                            
"Brooks Crossing",                                 
"Jackson Court",                                   
"Hill Court",                                      
"Todd Union",                                      
"Carlson Library",                                 
"Medical Center",                                  
"Whippler"]

locations.each do |loc|
	Location.create(name: loc)
end