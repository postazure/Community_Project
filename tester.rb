title_text = 'Alert'.upcase
body_text = 'body_text'
window_size = 50


window_size += 4
#top bar
puts "\t" + "%"*(window_size)

#title
title_string = "\t" + "% #{title_text.center(window_size)} "
puts title_string + "%".rjust(window_size - title_string.length)

#body
print "\t% " +
body_text.length/window_size = body_lines
if body_lines == 0
  line_text[0] = body_text
else
  body_lines.times do |i|
