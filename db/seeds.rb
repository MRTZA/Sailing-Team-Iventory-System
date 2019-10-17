# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
/
movies = [{:title => 'Aladdin', :rating => 'G', :release_date => '25-Nov-1992'},
    	  {:title => 'The Terminator', :rating => 'R', :release_date => '26-Oct-1984'},
    	  {:title => 'When Harry Met Sally', :rating => 'R', :release_date => '21-Jul-1989'},
      	  {:title => 'The Help', :rating => 'PG-13', :release_date => '10-Aug-2011'},
      	  {:title => 'Chocolat', :rating => 'PG-13', :release_date => '5-Jan-2001'},
      	  {:title => 'Amelie', :rating => 'R', :release_date => '25-Apr-2001'},
      	  {:title => '2001: A Space Odyssey', :rating => 'G', :release_date => '6-Apr-1968'},
      	  {:title => 'The Incredibles', :rating => 'PG', :release_date => '5-Nov-2004'},
      	  {:title => 'Raiders of the Lost Ark', :rating => 'PG', :release_date => '12-Jun-1981'},
      	  {:title => 'Chicken Run', :rating => 'G', :release_date => '21-Jun-2000'},
  	 ]

movies.each do |movie|
  Movie.create!(movie)
end
/
inventory = [{:item => 'Item One', :checked_out => 2, :total => 5},
			 {:item => 'Item Two', :checked_out => 0, :total => 25},
			 {:item => 'Item Three', :checked_out => 2, :total => 10},
			 {:item => 'Item Four', :checked_out => 5, :total => 5},
			 {:item => 'Item Five', :checked_out => 3, :total =>6},
			 {:item => 'Item Six', :checked_out => 2, :total => 7},
			 {:item => 'Item Seven', :checked_out => 1, :total => 8},
			 {:item => 'Item Eight', :checked_out => 0, :total => 9},
			 {:item => 'Item Nine', :checked_out => 2, :total => 10},
			 {:item => 'Item Ten', :checked_out => 3, :total => 11},
			]

inventory.each do |inventory|
	Inventory.create!(inventory)
end