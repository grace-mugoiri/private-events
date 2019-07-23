names = ["teddy","mary","emre","jose","carlos" ]

    names.each do |name|
    User.create!(name:  name)
  end
