# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "json"
require "open-uri"

# puts "Clearing DB..."
# Movie.destory_all()

puts "Seeding DB..."

url = "https://tmdb.lewagon.com/movie/top_rated"
response = URI.open(url).read
result = JSON.parse(response)
array = result["results"]

# 10.times do
#   i = 0
#   movie = Movie.new(
#     title: array[i]["title"],
#     poster_url: array[i]["poster_path"],
#     overview: array[i]["overview"],
#     rating: array[i]["vote_average"]
#   )
#   i += 1
#   movie.save!
# end

array.each_with_index do |hash, i|
  movie = Movie.new(
    title: hash["title"],
    poster_url: hash["poster_path"],
    overview: hash["overview"],
    rating: hash["vote_average"]
  )
  movie.save!
end

puts "Done!"
