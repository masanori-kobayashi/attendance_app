# coding: utf-8

User.create!(name: "管理者",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             employee_number: "1",
             uid: "1",
             admin: true)
             
User.create!(name: "上長１",
             email: "sample1@email.com",
             password: "password",
             password_confirmation: "password",
             employee_number: "2",
             uid: "2",
             instructor: true)
             
User.create!(name: "上長２",
             email: "sample2@email.com",
             password: "password",
             password_confirmation: "password",
             employee_number: "3",
             uid: "3",
             instructor: true)
             
User.create!(name: "上長３",
             email: "sample3@email.com",
             password: "password",
             password_confirmation: "password",
             employee_number: "4",
             uid: "4",
             instructor: true)

60.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  employee_number = "#{n+10}"
  uid = "#{n+1000}"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               employee_number: employee_number,
               uid: uid
               )
end