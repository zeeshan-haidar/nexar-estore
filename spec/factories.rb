# spec/factories.rb

# When you generate a User model (or any model) RSpec will generate a factory for you in your factories.rb file.
#   You can modify it to look like this.

FactoryBot.define do
  factory(:user) do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end
