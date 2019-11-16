require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
	describe '#create' do
		it 'Add Item with title' do
			Item.create :title => "stuff"
			last = Item.last()
			expect(last.title).to eq('stuff')
		end
		it 'Add Item with data' do
			Item.create :title => "stuff",
						:user => "does things",
						:checked_out => 0
			last = Item.last()
			expect(last.title).to eq('stuff')
			expect(last.user).to eq('does things')
			expect(last.checked_out).to eq(0)
		end
		it 'Add Items' do
			Item.create :title => "stuff",
						:user => "does things",
						:checked_out => 0
			Item.create :title => "thing",
						:user => "does stuff",
						:checked_out => 0
			Item.create :title => "widget",
						:user => "does things",
						:checked_out => 1
			last = Item.last(3)
			expect(last[0].title).to eq("stuff")
			expect(last[1].title).to eq("thing")
			expect(last[2].title).to eq("widget")
		end
		it 'Add many Items of Identical title' do
			max = 100
			for k in 0..max
				Item.create :title => "stuff",
							:user => "does things",
							:checked_out => 10
			end
			last = Item.last(max)
			last.each do |elem|
				expect(elem.title).to eq(last[0].title)
			end
		end
	end
	
	describe '#update' do
		it 'Update Item title' do
			Item.create :title => "stuff",
						:user => "does things",
						:checked_out => 0
			last = Item.last
			Item.update last.id,
						:title => "thing"
			new = Item.last
			expect(new.title).to eq("thing")
			expect(new.user).to eq(last.user)
			expect(new.checked_out).to eq(last.checked_out)
		end
		
		it 'Update Item user' do
			Item.create :title => "stuff",
						:user => "does things",
						:checked_out => 0
			last = Item.last
			Item.update last.id,
						:user => "does things different"
			new = Item.last
			expect(new.title).to eq(last.title)
			expect(new.user).to eq("does things different")
			expect(new.checked_out).to eq(last.checked_out)
		end
		
		it 'Update Item checked_out' do
			Item.create :title => "stuff",
						:user => "does things",
						:checked_out => 0
			last = Item.last
			Item.update last.id,
						:checked_out => 1
			new = Item.last
			expect(new.title).to eq(last.title)
			expect(new.user).to eq(last.user)
			expect(new.checked_out).to eq(1)
		end
		
		it 'Update Item date' do
		#
		end
		
		it 'Update all fields' do
			Item.create :title => "stuff",
						:user => "does things",
						:checked_out => 0
			last = Item.last
			Item.update last.id,
						:title => "thing",
						:user => "does things different",
						:checked_out => 1
			last = Item.last
			expect(last.title).to eq("thing")
			expect(last.user).to eq("does things different")
			expect(last.checked_out).to eq(1)
		end
	end
	
	describe '#destroy' do
		it 'Delete Item' do
			Item.create :title => "stuff",
						:user => "does things",
						:checked_out => 0
			Item.destroy Item.where("title = 'stuff'")
			last = Item.last
			expect(last).to eq(nil)
		end
		
		it 'Delete Item from multiple' do
			Item.create :title => "stuff",
						:user => "does things",
						:checked_out => 1
			Item.create :title => "thing",
						:user => "does stuff",
						:checked_out => 0
			Item.create :title => "widget",
						:user => "does thing",
						:checked_out => 1
			Item.destroy Item.where("title = 'thing'")
			last = Item.last(3)
			expect(last[0].title).to eq("stuff")
			expect(last[1].title).to eq("widget")
			expect(last[2]).to eq(nil)
		end

		it 'Delete multiple Items' do
			Item.create :title => "stuff",
						:user => "does things",
						:checked_out => 1
			Item.create :title => "thing",
						:user => "does stuff",
						:checked_out => 0
			Item.create :title => "widget",
						:user => "does thing",
						:checked_out => 1
			Item.create :title => "foobar",
						:user => "does anything",
						:checked_out => 0
			Item.destroy Item.where("title = 'thing'")
			Item.destroy Item.where("title = 'foobar'")
			Item.destroy Item.where("title = 'widget'")
			last = Item.last(4)
			expect(last[0].title).to eq("stuff")
			expect(last[1]).to eq(nil)
			expect(last[2]).to eq(nil)
			expect(last[3]).to eq(nil)
		end
		
		it 'Delete all Items' do
			Item.create :title => "stuff",
						:user => "does things",
						:checked_out => 1
			Item.create :title => "thing",
						:user => "does stuff",
						:checked_out => 0
			Item.create :title => "widget",
						:user => "does thing",
						:checked_out => 1
			Item.create :title => "foobar",
						:user => "does anything",
						:checked_out => 0
			Item.destroy_all
			last = Item.last(4)
			last.each do |elem|
				expect(elem).to eq(nil)
			end
		end		
		
	end
end
