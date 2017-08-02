# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(
  id: 2,
  username: 'BritDaSkywalker',
  email: 'bndufinetz@gmail.com',
  password: 'rico1212'
)

User.create(
  id: 3,
  username: 'Test3',
  email: 'test3@gmail.com',
  password: 'test03'
)

User.create(
  id: 4,
  username: 'Test4',
  email: 'test4@gmail.com',
  password: 'test04'
)


Question.delete_all

Question.create(
  id: 1,
  title: "Welcome to StackJoverFlow",
  user_id: 2,
  body: "There Is Something You Should Know!

  This is my very first post using markdown!

  How do you like it?  I learned this from [RichOnRails.com](http://richonrails.com/articles/rendering-markdown-with-redcarpet)!"
)

Question.create(
  id: 2,
  title: "Whats for lunch?",
  user_id: 1,
  body: "Im starving. Where is a good place to go for lunch?"
)

Question.create(
  id: 3,
  title: "How do you render forms in RoR?",
  user_id: 4,
  body: "I have been trying to use the `render` helper in my HTML

  But for some reasone it will
  ###NOT
  Do what I want it to"
)

Question.create(
  id: 4,
  title: "What is pagination?",
  user_id: 3,
  body: "Pagination has always given me trouble. How do I fix it?"
)

Answer.create(
  id: 1,
  body: 'Stack JF is the shizz!!',
  user_id: 2,
  question_id: 1
)

Answer.create(
  id: 2,
  body: 'Stack JF is the shizz!!',
  user_id: 3,
  question_id: 2
)

Answer.create(
  id: 3,
  body: 'Stack JF is the shizz!!',
  user_id: 1,
  question_id: 4
)
Answer.create(
  id: 4,
  body: 'Stack JF is the shizz!!',
  user_id: 4,
  question_id: 3
)
