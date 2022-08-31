require 'sinatra'
require 'faker'
class App < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/' do
    { message: "hello #{Faker::Name.first_name } this is the root route"}.to_json
  end
  
  
end

run App
