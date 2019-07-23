  20.times do
    name  = Faker::Name.name
    User.create!(name:  name)
  end
