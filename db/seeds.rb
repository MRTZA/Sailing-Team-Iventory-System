# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([{:email => 'murtaza.hakimi@gmail.com', :password => "123", :username => "admin", :permission => 1}])

items = [{:title => 'oar', :checked_out => 0, :user => '', :condition => 'good'},
         {:title => 'oar', :checked_out => 0, :user => '', :condition => 'good'},
         {:title => 'oar', :checked_out => 0, :user => '', :condition => 'good'},
         {:title => 'oar', :checked_out => 0, :user => '', :condition => 'good'},
         {:title => 'life jacket', :checked_out => 0, :user => '', :condition => 'good'},
         {:title => 'life jacket', :checked_out => 0, :user => '', :condition => 'good'},
         {:title => 'life jacket', :checked_out => 0, :user => '', :condition => 'good'},
         {:title => 'life jacket', :checked_out => 0, :user => '', :condition => 'good'},
         {:title => 'life jacket', :checked_out => 0, :user => '', :condition => 'good'},
         {:title => 'life jacket', :checked_out => 0, :user => '', :condition => 'good'},
         {:title => 'hull', :checked_out => 0, :user => '', :condition => 'good'},
         {:title => 'hull', :checked_out => 0, :user => '', :condition => 'good'},
         {:title => 'sail', :checked_out => 0, :user => '', :condition => 'good'},
         {:title => 'sail', :checked_out => 0, :user => '', :condition => 'good'},
         {:title => 'sail', :checked_out => 0, :user => '', :condition => 'good'},
        ]

items.each do |item|
  Item.create!(item)
end