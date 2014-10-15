class Menu
  def main_menu
    @menu_main_list = ['Change User Preferences', 'Create a Note', 'Exit']
    displayMenu @menu_main_list
  end

  def displayMenu menuItems
    puts "\tWhat would you like to do?"
    puts "\t-----------------------------------------"
    last_item_number = 0
    menuItems.each_with_index do |item, i|
      puts "\t#{i+1}. #{item.capitalize}"
      last_item_number = i
    end
    if menuItems != @menu_main_list
      puts "\t#{last_item_number+2}. Main Menu"
    end
    puts "\t-----------------------------------------"
    puts "Please enter number to make your selection."


    userActivity = (gets.chomp.to_i)

  end


end
