# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Question.delete_all

Question.create(
  id: 1,
  title: "Welcome to StackJoverFlow",
  body: "There Is Something You Should Know!

  This is my very first post using markdown!

  How do you like it?  I learned this from [RichOnRails.com](http://richonrails.com/articles/rendering-markdown-with-redcarpet)!"
)

Question.create(
  id: 2,
  title: "Whats for lunch?",
  body: "Im starving. Where is a good place to go for lunch?"
)

Question.create(
  id: 3,
  title: "How do you render forms in RoR?",
  body: "I have been trying to use the `render` helper in my HTML

  But for some reasone it will
  ###NOT
  Do what I want it to"
)

Question.create(
  id: 4,
  title: "What is pagination?",
  body: "Pagination has always given me trouble. How do I fix it?"
)