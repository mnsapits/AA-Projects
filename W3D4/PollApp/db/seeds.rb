# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create!(user_name: "Micah")
user2 = User.create!(user_name: "Mandy")

poll1 = Poll.create!(title:"legalize_marijuana",author_id:1)
poll2 = Poll.create!(title:"Trump or Clinton",author_id:2)

question1 = Question.create!(poll_id:1, text:"Does THC have health benefits?")
question2 = Question.create!(poll_id:1, text:"Will this help our economy?")
question3 = Question.create!(poll_id:2, text:"Is Trump an idiot?")
question4 = Question.create!(poll_id:2, text:"Is Hillary human?")
question5 = Question.create!(poll_id:2, text:"Do you wanna build a wall?")

answer1 = Answer.create!(question_id:1 ,text:"Yes")
answer2 = Answer.create!(question_id:1 ,text:"No")
answer3 = Answer.create!(question_id:2 ,text:"Yes")
answer4 = Answer.create!(question_id:2 ,text:"No")
answer5 = Answer.create!(question_id:3 ,text:"Yes")
answer6 = Answer.create!(question_id:3 ,text:"No")
answer7 = Answer.create!(question_id:4 ,text:"Yes")
answer8 = Answer.create!(question_id:4 ,text:"No")
answer9 = Answer.create!(question_id:5 ,text:"Yes")
answer10 = Answer.create!(question_id:5 ,text:"No")

response1 =  Response.create!(user_id:1,answer_id:1)
response2 =  Response.create!(user_id:1,answer_id:3)
response3 =  Response.create!(user_id:1,answer_id:5)
response4 =  Response.create!(user_id:1,answer_id:7)
response5 =  Response.create!(user_id:1,answer_id:9)

response6 =  Response.create!(user_id:2,answer_id:2)
response7 =  Response.create!(user_id:2,answer_id:4)
response8 =  Response.create!(user_id:2,answer_id:6)
response9 =  Response.create!(user_id:2,answer_id:8)
response10 =  Response.create!(user_id:2,answer_id:10)
