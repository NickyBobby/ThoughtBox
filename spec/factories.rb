FactoryGirl.define do
  factory :link do
    
  end
  factory :user do
    first_name "Nick"
    last_name  "D"
    email      "bdiddybreeze@yahoo.com"
    password   "password"
    password_confirmation "password"
  end
end
