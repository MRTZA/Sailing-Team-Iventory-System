module ItemHelper
  # Checks if a number is odd:
  def oddness(count)
    count.odd? ?  "odd" :  "even"
  end

  def self.all_options
    ['All Turned In', 'All Checked Out', 'Any Checked Out']
  end

end

