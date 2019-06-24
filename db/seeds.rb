# coding: utf-8

User.create!(name: "管理者",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             admin: true)
             
User.create!(name: "上長１",
             email: "sample1@email.com",
             password: "password",
             password_confirmation: "password",
             instructor: true)
             
User.create!(name: "上長２",
             email: "sample2@email.com",
             password: "password",
             password_confirmation: "password",
             instructor: true)
             
User.create!(name: "上長３",
             email: "sample3@email.com",
             password: "password",
             password_confirmation: "password",
             instructor: true)

60.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end