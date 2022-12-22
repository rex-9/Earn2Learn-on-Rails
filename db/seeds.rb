# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

dante = User.create(
  email: "dante@dmc.com",
  password: "password",
  username: "Dante",
  fullname: "Htet Naing",
  catchphrase: "Pizza is the Best!",
  goal: "Devil Hunter",
  city: "Yangon",
  role: "admin",
  birthdate: "18-03-2000",
  phone: "09443112251"
)

User.create(
  email: "rex@soul.com",
  password: "password",
  username: "Rex",
  fullname: "Htet Naing",
  catchphrase: "Spiritual Full-Stack Developer",
  goal: "Software Developer",
  city: "Yangon",
  birthdate: "18-03-2000",
  phone: "094431122510"
)

User.create(
  email: "sasa@sasa.com",
  password: "password",
  username: "SaSa",
  fullname: "Sa Aung Htet Nyein",
  catchphrase: "Bebe is the Best!",
  goal: "Data Scientist",
  city: "Yangon",
  birthdate: "07-11-1999",
  phone: "09443112250"
)

react = Technology.create(name: "React")
ruby = Technology.create(name: "Ruby")

Study.create(
  topic: "State Management",
  user_id: 1,
  technology_id: 1
)
Study.create(
  topic: "Object Oriented Programming",
  user_id: 2,
  technology_id: 2
)

Profession.create(
  user_id: 1,
  technology_id: react.id,
)
Profession.create(
  user_id: 2,
  technology_id: ruby.id,
)

Certificate.create(
  title: "React Master",
  link: "https://www.credential.net/profile/htetnaingnaing703191/wallet",
  achieved_date: "2021-10-10",
  user_id: 1,
  technology_id: 1
)

Like.create(
  user_id: 1,
  study_id: 1,
)

Like.create(
  user_id: 1,
  study_id: 2,
)

Comment.create(
  content: "The First comment",
  user_id: 1,
  study_id: 1,
  username: dante.username
)

Comment.create(
  content: "The Second comment",
  user_id: 1,
  study_id: 2,
  username: dante.username
)
