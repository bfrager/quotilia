Fabricator(:post) do
  username { Faker::Internet.user_name }
  name { Faker::Name.first_name }
  surname { Faker::Name.last_name }
  password { "testtest" }
  password_confirmation { |attrs| attrs[:password] }
end
