# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# area, subject info - just using the scripts set up

case Rails.env

# when "development"

  Payment.destroy_all
  Lesson.destroy_all
  Tutor.destroy_all
  Student.destroy_all
  Area.destroy_all
  Subject.destroy_all

  load './db/scripts/perth.rb'
  load './db/scripts/subject.rb'

  # Tutors
  # destroy tutors after seed - Tutor.destroy_all(['id In (?)', Tutor.last(100).collect(&:id)])
  # Tutor.destroy_all(['id not In (?)', Tutor.first(5).collect(&:id)])
  100.times do 
    Tutor.create(
      email: Faker::Internet.email,
      password: ENV['SEED_USER_PASSWORD'], 
      password_confirmation: ENV['SEED_USER_PASSWORD'],
      firstname: Faker::Name.first_name,
      lastname: Faker::Name.last_name,
      confirmation_sent_at: Time.now,
      confirmed_at: Time.now,
      verified: true,
      picture: Faker::Avatar.image,
      rate: Random.rand(10..200),
      about: Faker::Hipster.paragraphs(rand(0..20)).join("\n")[0..1999],
      experience: Faker::Hipster.paragraphs(rand(0..20)).join("\n")[0.1999],
      date_of_birth: Faker::Date.between(80.years.ago, 18.years.ago),
      suburb: Area.order("RANDOM()").first.id,
      sex: Random.rand(0..1),
      availability: (0..6).to_a.shuffle.take(Random.rand(0..6)).map(&:to_s),
      :subject_ids => Subject.ids.shuffle.take(Random.rand(0..Subject.count))
    )
  end

  100.times do 
    Student.create(
      email: Faker::Internet.email,
      password: "password", 
      password_confirmation: "password",
      firstname: Faker::Name.first_name,
      lastname: Faker::Name.last_name,
      confirmation_sent_at: Time.now,
      confirmed_at: Time.now,
    )
  end

  500.times do
    tutor = Tutor.last(100).shuffle.first
    if(tutor.subjects.any?)
      tutor.lessons.create(
        student_id: Student.last(100).shuffle.first.id,
        date: Faker::Date.between(1.months.ago, 2.months.from_now),
        description: Faker::Hipster.paragraphs(rand(0..5)).join("\n"),
        duration: Random.rand(30..180),
        tutor_change: Random.rand(0..1),
        location: Faker::Hipster.sentence,
        subject: tutor.subjects.shuffle.first.display_name,
      )
    end
  end

# when "production"
#    # No seeding
# end