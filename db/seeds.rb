# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  "admin",
             email: "admin@kerzzi.com",
             password:              "123456",
             password_confirmation: "123456",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "test1",
            email: "test1@kerzzi.com",
            password:              "123456",
            password_confirmation: "123456",
            admin: false,
            activated: true,
            activated_at: Time.zone.now)

User.create!(name:  "test2",
            email: "test2@kerzzi.com",
            password:              "123456",
            password_confirmation: "123456",
            admin: false,
            activated: true,
            activated_at: Time.zone.now)


99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end


company_info= [["Apple Inc.","Cupertino, CA, US"] ,["Samsung Electronics","Suwon, South Korea"] ,
["Amazon.com","Seattle, WA, US"] ,["HP Inc. + HPE","Palo Alto, CA, US"] ,["Microsoft","Redmond, WA, US"] ,
["IBM","Armonk, NY, US"] ,["Alphabet Inc.","Mountain View, CA, US"] ,["Dell Technologies","Austin, TX, US"] ,
["Huawei","Shenzhen, China"]]

jobs_info = [["Web Application Developer","Creates, maintains and implements web-based application systems. Resolves issues and recommends enhancements, when necessary. Has knowledge of HTML, Java and related concepts. Relies on knowledge and professional discretion to plan and accomplish goals. Usually reports to a department head. Significant ingenuity and flexibility is expected. May require a bachelor’s degree in a related area and at least 2-4 years of relevant experience."
],[ "Android Developer","Designs and builds applications for the Android platform. Works with outside data sources and API’s. Fixes bugs and improves application performance. Collaborates with cross-functional teams to determine and launch new features. Should have knowledge of core web technologies (HTML5, CSS3, JavaScript). Requires a bachelor’s degree in area of specialty and 2 years of relevant experience."
],["iOS Developer","Designs and builds applications for the iOS platform. Works with outside data sources and API’s. Fixes bugs and improves application performance. Collaborates with cross-functional teams to determine and launch new features. Should have knowledge of core web technologies (HTML5, CSS3, JavaScript). Requires a bachelor’s degree in area of specialty and 2 years of relevant experience."
],["Interface Designer","Create interfaces for a variety of web-based applications. Designs and evaluates visual human interfaces utilizing user-centric design principles. Works with the product development team to achieve desired user experience. Ensures that interfaces function to achieve desired business goals. Relies on established guidelines and instructions to perform daily job functions. Works under immediate supervision and usually reports to a supervisor. May require an associate’s degree with 0-2 years of relevant experience."
],["Webmaster","Manages an organization’s overall web presence. Monitors web traffic and ensures website is prepared to meet traffic demands and performance expectations. Leads the development and design of the website to enhance appearance and usability. Requires a working knowledge of HTML, JavaScript and SQL. Relies on knowledge and professional discretion to plan and accomplish goals. Works under general supervision and usually reports to a supervisor, though some ingenuity and flexibility is required. May require a bachelor’s degree and 2-4 years of experience."
]]


puts "this seed will create  30 public jobs, and 30 hidden jobs"

create_jobs = for i in 1..10 do
 job_test=jobs_info[rand(0..4)]
 company_test=company_info[rand(0..8)]
 Job.create!([title: job_test[0],
              description: job_test[1],
              is_hidden:"false",
              city: "北京",
              company: "网易",
              category: "developer",
              user_id: 1])
end

create_jobs = for i in 1..10 do
 job_test=jobs_info[rand(0..4)]
 company_test=company_info[rand(0..8)]
 Job.create!([title: job_test[0],
              description: job_test[1],
              is_hidden:"false",
              city: "上海",
              company: "百度",
              category: "developer",
              user_id: 1])
end

create_jobs = for i in 1..10 do
 job_test=jobs_info[rand(0..4)]
 company_test=company_info[rand(0..8)]
 Job.create!([title: job_test[0],
              description: job_test[1],
              is_hidden:"false",
              city: "广州",
              company: "新生大学",
              category: "healthcare",
              user_id: 1])
end

create_jobs = for i in 1..10 do
 job_test=jobs_info[rand(0..4)]
 company_test=company_info[rand(0..8)]
 Job.create!([title: job_test[0],
              description: job_test[1],
              is_hidden:"false",
              city: "深圳",
              company: "Facebook",
              category: "customer-service",
              user_id: 1])
end

create_jobs = for i in 1..10 do
 job_test=jobs_info[rand(0..4)]
 company_test=company_info[rand(0..8)]
 Job.create!([title: job_test[0],
              description: job_test[1],
              is_hidden:"false",
              city: "纽约",
              company: "三体",
              category: "sales-marketing",
              user_id: 1])
end

create_jobs = for i in 1..10 do
 job_test=jobs_info[rand(0..4)]
 company_test=company_info[rand(0..8)]
 Job.create!([title: job_test[0],
              description: job_test[1],
              is_hidden:"false",
              city: "香港",
              company: "搜狐",
              category: "legal",
              user_id: 1])
end

create_jobs = for i in 1..10 do
 job_test=jobs_info[rand(0..4)]
 company_test=company_info[rand(0..8)]
 Job.create!([title: job_test[0],
              description: job_test[1],
              is_hidden:"false",
              city: "南京",
              company: "扬帆社区",
              category: "non-profit",
              user_id: 1])
end

create_jobs = for i in 1..10 do
 job_test=jobs_info[rand(0..4)]
 company_test=company_info[rand(0..8)]
 Job.create!([title: job_test[0],
              description: job_test[1],
              is_hidden:"false",
              city: "芝加哥",
              company: "Google",
              category: "human-resource",
              user_id: 1])
end

create_jobs = for i in 1..10 do
 job_test=jobs_info[rand(0..4)]
 company_test=company_info[rand(0..8)]
 Job.create!([title: job_test[0],
              description: job_test[1],
              is_hidden:"false",
              city: "新西兰",
              company: "魔戒剧组",
              category: "design",
              user_id: 1])
end

puts "80 Public jobs created."

create_jobs = for i in 1..10 do
 job_test=jobs_info[rand(0..4)]
 company_test=company_info[rand(0..8)]
 Job.create!([title: job_test[0],
             description: job_test[1],
               is_hidden:"true",
               city: "上海",
               company: "百度",
               category: "healthcare",
               user_id: 1])
end

puts "10 Hidden jobs created."

User.create!(name:  "test3",
            email: "test3@kerzzi.com",
            password:              "123456",
            password_confirmation: "123456",
            admin: false,
            activated: true,
            activated_at: Time.zone.now)

User.create!(name:  "test4",
            email: "test4@kerzzi.com",
            password:              "123456",
            password_confirmation: "123456",
            admin: false,
            activated: true,
            activated_at: Time.zone.now)

User.create!(name:  "test5",
            email: "test5@kerzzi.com",
            password:              "123456",
            password_confirmation: "123456",
            admin: false,
            activated: true,
            activated_at: Time.zone.now)


User.create!(name:  "test6",
            email: "test6@kerzzi.com",
            password:              "123456",
            password_confirmation: "123456",
            admin: false,
            activated: true,
            activated_at: Time.zone.now)

User.create!(name:  "test7",
            email: "test7@kerzzi.com",
            password:              "123456",
            password_confirmation: "123456",
            admin: false,
            activated: true,
            activated_at: Time.zone.now)

users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end


# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
