module ItemsHelper
  def sum_item(items, title)
    @items = items
    item_temp = Array.new

    @items.each do |item|
      if item.title.eql? title
        item_temp.push(item)
      end
    end
    return item_temp
  end

  def checked_out_count(items, title)
    @items = items
    item_count = 0

    @items.each do |item|
      if item.title.eql? title and item.checked_out != nil and item.checked_out > 0
        item_count = item_count + 1
      end
    end
    return item_count
  end
end

