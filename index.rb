#!/usr/bin/ruby

require "httparty"
require 'colorize'

puts <<EDF
  _____         .__                 ___________                  .__              .__   
  /  _  \   ____ |__| _____   ____   \__    ___/__________  _____ |__| ____ _____  |  |  
 /  /_\  \ /    \|  |/     \_/ __ \    |    |_/ __ \_  __ \/     \|  |/    \\__  \ |  |  
/    |    \   |  \  |  Y Y  \  ___/    |    |\  ___/|  | \/  Y Y  \  |   |  \/ __ \|  |__
\____|__  /___|  /__|__|_|  /\___  >   |____| \___  >__|  |__|_|  /__|___|  (____  /____/
        \/     \/         \/     \/               \/            \/        \/     \/      
By @ilovebewbs on github
EDF

puts "Type an anime title: ".magenta

anime = gets.chop()

resp = HTTParty.get("https://api.jikan.moe/v3/search/anime?q=#{anime}")
resp['results'].each() do |anime|
    puts "Title: #{anime['title']}".cyan
    puts "Synopsis: #{anime['synopsis']}".green
    puts "AIred from #{anime['start_date']} to #{anime['end_date']}".yellow
    puts "Score: #{anime['score']}  |  #{anime['rated']}".light_red
    puts
end
