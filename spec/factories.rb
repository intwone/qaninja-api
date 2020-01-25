require "faker"
require_relative "models/UserModel"

FactoryBot.define do
  factory :user, class: UserModel do
    full_name { "Papito Skywalker" }
    email { "papito@jedi.com" }
    password { "jedi123" }

    after(:build) do |user|
      Database.new.deleteUser(user.email)
    end
  end

  factory :registeredUser, class: UserModel do
    id { 0 }
    full_name { Faker::Movies::StarWars.character }
    email { Faker::Internet.free_email(full_name) }
    password { "jedi123" }

    after(:build) do |user|
      Database.new.deleteUser(user.email)
      result = ApiUser.save(user.toHash)
      user.id = result.parsed_response["id"]
    end
  end

  factory :userWrongEmail, class: UserModel do
    full_name { "Papito Skywalker" }
    email { "papito#edi.com" }
    password { "jedi123" }
  end

  factory :emptyUserName, class: UserModel do
    full_name { "" }
    email { "papito1@jedi.com" }
    password { "jedi123" }
  end

  factory :emptyUserEmail, class: UserModel do
    full_name { "Cassio Oliveira" }
    email { "" }
    password { "jedi123" }
  end

  factory :emptyPassword, class: UserModel do
    full_name { "Cassio Oliveira" }
    email { "cassio@gmai.com" }
    password { "" }
  end

  factory :nullEmail, class: UserModel do
    full_name { "Tony Stark" }
    password { "pwd123" }
  end
end
