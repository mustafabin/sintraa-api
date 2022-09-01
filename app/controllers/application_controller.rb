class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/' do
    { message: "hello #{Faker::Name.first_name } this is the root route"}.to_json
  end
  get '/fruits' do
    Fruit.all.to_json
  end
  
  get '/characters' do
    User.all.to_json
  end
  
  get '/characters/:id' do
    user_data = User.find(params[:id])
    # i had to parse it into json twice because the out putting string in 
    # {
    #   user: user_data.to_json 
    # }
    # looked like 
    # \"id\":26,\"name\":\"Donquixote Doflamingo\",\"email\":\"DonquixoteDoflamingo@bounty.com\",

    # there is probably a better way to do this
    {
      user:JSON.parse( user_data.to_json),
      fruits:JSON.parse( user_data.fruits.to_json)
    }.to_json
  end

  post "/eat-devil-fruit" do
    data = JSON.parse request.body.read
    Fruit.create(name: data['devil_fruit'], user_id:data['user_id'] )
    user_data = User.find(data['user_id'])
    {
      user:JSON.parse( user_data.to_json),
      fruits:JSON.parse( user_data.fruits.to_json)
    }.to_json
  end
  
  delete "/destory-character/:id" do
    user_data = User.find(params[:id])
    user_data.destroy
    user_data.to_json
  end

  put "/update-character" do
    data = JSON.parse request.body.read
    user_data = User.find(data['user_id'])
    # if data["key"] is empty default to old values
    user_data.name = data['name'] || user_data.name
    user_data.email = data['email'] || user_data.email
    user_data.password = data['password'] || user_data.password
    user_data.save
    user_data.to_json
  end
end