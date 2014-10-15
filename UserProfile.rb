
require 'yaml'
require 'fileutils' #FileUtils.mkdir_p 'dir_name'

class UserProfile

  def initialize
    @pref_filename = '/username/userPref.txt'
    @pref_default_options = {'bold' => 'on, off', 'open' => 'min, max', 'resolution' => 'high, low'}

    @pref_userSettings = {}
    @pref_default_options.each do |key, value|
      @pref_userSettings[key] = value
    end

    @userName = ''

    userLogin
  end

  def newUser #Create Dir for each user and save pref to that folder
    while true
      print "Create a Username (or, type 'exit'): "
      @userName = gets.chomp

      if @userName.downcase == 'exit'
        exit
      elsif newUser_valid @userName
        break
      end
    end
    
    puts
    puts "You need to setup your preferences to continue."
    @pref_userSettings.each do |key, value|
      puts "#{key}: #{value} <- type in your selection"
      userSelection = gets.chomp.upcase
      @pref_userSettings[key] = "#{userSelection}"
    end

    newUser_mkdir
    filename = "./users/#{@userName}/#{@userName}Pref.txt" # we need to check if user already exists
    @pref_filename = filename
    yaml_save filename
    loadUserPref

  end

  def newUser_mkdir
      FileUtils.mkdir_p "./users/#{@userName}"
  end

  def newUser_valid username
    if File.directory?("./users/#{username}")
      puts
      puts "\t%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
      puts "\t%                 ALERT                   %"
      puts "\t% Sorry that user ID has been taken.      %"
      puts "\t% Login as that user or creat a new user. %"
      puts "\t%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
      puts
    end
  end


  def userLogin
    puts "Enter username or type 'New User' to creat a new user."
    print "Username: "
    @userName = gets.chomp

    if @userName.downcase == 'new user'
      newUser
    else
      @pref_filename = "./users/#{@userName}/#{@userName}Pref.txt"
      if !File.exist?(@pref_filename)
        puts "Username does not exist!"
        userLogin
      else
        loadUserPref

      end
    end
  end

  def loadUserPref
    prefArray = yaml_load @pref_filename
    user_pref = {}
    prefArray.each do |key, value|
      dividerOption = value.index('#')
      pref_setting = value[0 .. dividerOption -1].strip
      user_pref[key] = pref_setting
    end
    puts
    @pref_userSettings = user_pref
  end

  def yaml_save filename
    @pref_userSettings.each_key do |key|
      @pref_userSettings[key] = "#{@pref_userSettings[key]} ##{@pref_default_options[key]}"
    end
    File.open filename, 'w' do |f|
      f.write(@pref_userSettings.to_yaml)
    end
  end

  def yaml_load filename
    yaml_string = File.read(filename)
    YAML::load yaml_string
  end


  #---List
  def getUserPref_list
    keyList = []
    @pref_userSettings.each_key do |key|
      keyList.push(key)
    end
    return keyList
  end
  #---View
  def getUserPref_bold
    @pref_userSettings['bold']
  end
  def getUserPref_open
    @pref_userSettings['open']
  end
  def getUserPref_resolution
    @pref_userSettings['resolution']
  end
  #---Modify
  def modUserPref_bold
    self.modUserPref('bold')
  end
  def modUserPref_open
    self.modUserPref('open')
  end
  def modUserPref_resolution
    self.modUserPref('resolution')
  end
  def modUserPref key

    loadUserPref
    puts "#{key}: #{@pref_userSettings[key]} <- Current Setting  |#{@pref_default_options[key]}"
    userSelection = gets.chomp.upcase
    @pref_userSettings[key] = "#{userSelection}"


    yaml_save @pref_filename
    yaml_load @pref_filename
  end
end
