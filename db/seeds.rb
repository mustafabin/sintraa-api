puts "seeding fake users ..."

5.times do
    User.create(name: Faker::Name.name,email: Faker::Internet.email, password: Faker::Lorem.word)
end
  
puts "users created successfully"