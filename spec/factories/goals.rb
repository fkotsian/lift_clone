# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :goal do
    title "MyString"
    description "MyText"
    completed false
    public false
  end
end
