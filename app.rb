require "sinatra"
require "sinatra/reloader"

get("/howdy") do
  erb(:hello)
end

get("/goodbye") do
  erb(:bye)
end

get("/square/new") do
  erb(:new_square_calc)
end

get("/square/results") do
  erb(:square_results)
end

get("/square/new") do
  erb(:square_form)
end

get("/") do
  erb(:index)
end
