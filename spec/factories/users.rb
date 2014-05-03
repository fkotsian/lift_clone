# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    factory :jeff do
      username "Jeff"
      password "password"
    end

    factory :buck do
      username "Buck"
      password "australia"
    end
  end
end
