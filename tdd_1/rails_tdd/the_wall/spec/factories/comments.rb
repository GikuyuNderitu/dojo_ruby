FactoryGirl.define do
  factory :comment do
    comment "This ought to provide valid comment data."
    user nil
    message
  end
end
