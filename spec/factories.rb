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
end
