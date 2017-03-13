FactoryGirl.define do
  factory :message do
    message "Here is a test string. This string should validate without any problem!"
    user
  end
end
