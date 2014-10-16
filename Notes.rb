class Notes
  def initialize
    @filename_arr = []
    get_filename_arr
  end


  def list_dir
    get_filename_arr
    puts
    puts "Note Files:"
    puts "-----------"
    @filename_arr.each_with_index do |item, i|
      puts "\t#{i+1} #{item}"
    end
  end

  def get_filename_arr
    @filename_arr = Dir['*.cpn']
  end

  def which_file
    list_dir
    puts
    puts "Which file? Please enter the number."
    fileIndex = (gets.chomp.to_i) -1
    filename = @filename_arr[fileIndex]
  end

  def viewNote
    filename = which_file
    text = load_file filename
    header = "View File: #{filename}"
    puts
    puts header
    puts "-"*header.length
    puts text
    puts "-"*((header.length-10)/2) +"END OF FILE"+ "-"*((header.length-10)/2)
    puts
  end

  def newNote
    get_filename_arr
    puts "Create New Note"
    print "Note Title: "
    filename = gets.chomp.strip + '.cpn'

    if @filename_arr.include?("#{filename}")
      puts "A file with that name already exists."
      newNote
    elsif filename == '.cpn'
      puts "File name cannot be blank."
      newNote
    else
      save_file filename, '<this file is empty>'
    end

    text = newNote_text
    save_file filename, text
  end

  def newNote_text
    text = ''
    puts "Enter Text (when done enter type: --exit)"
    puts "-----------------------------------"
    while true
      newLine = gets
      if newLine.chomp.downcase == "--exit"
        break
      end
      text = text + newLine
    end
    text

  end

  def editNote
    #no ideas how to do this
  end

  def deleteNote
    filename = which_file
    puts
    puts "Are you sure you want to DELETE #{filename}? (y/n)"
    confirm = gets.chomp.downcase
    if confirm == 'y'
      File.delete(filename)
      get_filename_arr
      if !@filename_arr.include?("#{filename}")
        puts
        puts "Note: #{filename} deleted succesfully."
        puts
      else
        puts
        puts "Note: #{filename} was NOT deleted."
        puts
      end
    end

  end


  def load_file filename
    readString = File.read filename
  end

  def save_file filename, text
    File.open filename, 'w' do |f|
      f.write text
    end
  end

end

# note = Notes.new
# note.deleteNote

# note.newNote
# note.viewNote
