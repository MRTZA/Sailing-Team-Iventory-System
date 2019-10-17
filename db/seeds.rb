# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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