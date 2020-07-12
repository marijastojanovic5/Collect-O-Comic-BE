# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rest-client'
require 'byebug'
require 'json'
require 'active_support/all'
ComicBook.destroy_all


xml_data = RestClient.get('https://comicvine.gamespot.com/api/series_list/?api_key=5c79970e6970b47b3faa3b6215e08c0fe43e163f')
comics_hash = Hash.from_xml(xml_data.body)
series_array = comics_hash["response"]["results"]["series_list"]


series_array.each do |series|
    image = series["image"]["screen_url"]
    name = series["name"]
    if series["deck"] == nil
       description = "No description available"
    else
        description =  series["deck"]
    end
    episode_count =     series["count_of_episodes"]
    ComicBook.create(image: image, name: name, description: description,count_of_episodes: episode_count,rating: 0 )
end

# amia = User.create(name:"Amia")
# marija = User.create(name:"Marija")
# jenny = User.create(name:"Jenny")

# collection1 = Collection.create(user_id:  ,comic_book_id: 1)




    

# byebug
# 0




