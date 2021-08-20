require 'rubygems'
require "sinatra"
require_relative "lib/movie"
require_relative "lib/movie_store"

store = MovieStore.new("movie_store.yml")

get("/") do
  @movies = store.all
  erb :index
end

get("/new") do
  erb :new
end

post("/create") do
  @movie = Movie.new
  @movie.title = params["title"]
  @movie.year = params["year"]
  @movie.director = params["director"]
  store.save(@movie)
  redirect "/"
end
