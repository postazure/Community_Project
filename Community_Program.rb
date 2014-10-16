require_relative 'UserProfile'
require_relative 'Menu'
require_relative 'Notes'





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
  note = Notes.new
  note_menu_list = ['View Note','New Note','Delete Note']
  selection = $menu.displayMenu(note_menu_list)
  if selection == 1
    note.viewNote
  elsif selection == 2
    note.newNote
  elsif selection == 3
    note.deleteNote
  elsif selection == 4
    main_menu
  else
    notVaild_selection
  end
  note_menu
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

puts "\n"*100
puts "Community Project"
puts "-----------------"
puts "\n"*4

$user = UserProfile.new
$menu = Menu.new
main_menu
