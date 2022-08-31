puts "deleting users and devil fruits..."
User.destroy_all
Fruit.destroy_all
puts "creating users and devil fruits..."
10.times do
    name = Faker::JapaneseMedia::OnePiece.character
    new_user = User.create(name: name,email: "#{name.delete(' ')}@bounty.com", password: Faker::JapaneseMedia::OnePiece.quote)
    Fruit.create(name: Faker::JapaneseMedia::OnePiece.akuma_no_mi, user_id: new_user.id)
end

  
puts "seeded successfully 👒🏴‍☠️"