require_relative 'UserProfile'
require_relative 'Menu'
#require_relative 'Notes'


$user = UserProfile.new
$menu = Menu.new


def main_menu
  while true
    selection = $menu.main_menu
    if selection == 1
      userPref_menu
    elsif selection == 2
      note_menu
    elsif selection == 3
      exit
    else
      notVaild_selection
    end
  end
end

def userPref_menu
  menu_list = $user.getUserPref_list
  selection = $menu.displayMenu(menu_list)
  if selection == 1
    puts "---------------"
    $user.modUserPref_bold
  elsif selection == 2
    $user.modUserPref_open
  elsif selection == 3
    $user.modUserPref_resolution
  elsif selection == 4
    main_menu
  else
    notVaild_selection
  end
  userPref_menu
end

def note_menu
  puts
  puts "\t%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
  puts "\t%           UNDER CONSTRUCTION          %"
  puts "\t% Sorry, this option doesn't exist yet. %"
  puts "\t% Please, check again. Thank you.       %"
  puts "\t%                                       %"
  puts "\t% >Press 'ENTER'/ 'RETURN' to contine.  %"
  puts "\t%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
  puts

  gets
  main_menu
end

def notVaild_selection
  puts
  puts "\t%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
  puts "\t%      NOT A VALID SELECTION      %"
  puts "\t% That is not a valid input.      %"
  puts "\t% Please enter a number to select %"
  puts "\t% a menu item.                    %"
  puts "\t%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
  puts
  main_menu
end

main_menu
