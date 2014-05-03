# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :goal do

    factory :test_goal do
      title "Win at App Academy"
      description "Win at AA Assessments"
      completed false
      public true
    end

    factory :private_goal do
      title "Keep it secret"
      description "Keep it safe"
      completed false
      public false
    end

    factory :completed_goal do
      title "I kick ass"
      description "so much ass"
      completed true
      public true
    end

    factory :buck_goal do
      title "Banana SMOOTOOOOTHIE"
      description "Woo hoo!"
      completed true
      public true
    end
  end
end
