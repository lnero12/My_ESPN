require 'URI'
require 'net/http'
require 'JSON'


def get_todays_schedule
    t = Time.now
    todays_date_string = "start_date=#{t.strftime("%Y-%m-%d")}&end_date=#{t.strftime("%Y-%m-%d")}"
uri = URI("https://www.balldontlie.io/api/v1/games?#{todays_date_string}")
 Net::HTTP.get(uri)
response =  Net::HTTP.get(uri)
parsed = JSON.parse(response)
        puts "Todays NBA Schedule"
         parsed["data"].each do |game|
          puts "#{game["home_team"]["full_name"]}" " vs " + "#{game["visitor_team"]["full_name"]}"
        end
    end
   get_todays_schedule