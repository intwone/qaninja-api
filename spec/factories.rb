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

  factory :duplicateEmail, class: UserModel do
    full_name { "Tony Stark" }
    email { "tony@stark.com" }
    password { "pwd123" }
  end

  factory :nullEmail, class: UserModel do
    full_name { "Tony Stark" }
    email { }
    password { "pwd123" }
  end
end
