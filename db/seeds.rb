# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# area, subject info - just using the scripts set up

case Rails.env

when "development"
  # Tutors
  # destroy tutors after seed - Tutor.destroy_all(['id Not In (?)', Tutor.first(5).collect(&:id)])
  100.times do 
    Tutor.create(
      email: Faker::Internet.email,
      password: "password", 
      password_confirmation: 'password',
      firstname: Faker::Name.first_name,
      lastname: Faker::Name.last_name,
      confirmed_at: Time.now,
      verified: true,
      picture: Faker::Avatar.image,
      rate: Random.rand(10..200),
      about: Faker::Lorem.paragraphs(rand(0..20)).join("\n"),
      experience: Faker::Lorem.paragraphs(rand(0..20)).join("\n"),
      date_of_birth: Faker::Date.between(80.years.ago, 18.years.ago),
      suburb: Area.order("RANDOM()").first.display_name,
      sex: Random.rand(0..1),
      availability: (0..6).to_a.shuffle.take(Random.rand(0..6)).map(&:to_s),
    )
  end







  # students







  #lessons








when "production"
   # No seeding
end