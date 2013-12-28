FactoryGirl.define do
  
  factory :user do
    sequence(:email) { |i| "email#{i}@email.com" }
    password "password"
    password_confirmation "password"
  end

  factory :post do
    title "Just another title"
    text "Just another text"
    association(:user)
  end

  factory :comment do
    body "Just another comment"
    association(:user)
    association(:post)
  end

  factory :tag do
    tag_text "Just another tag"
  end

  factory :category do
    association(:post)
    association(:tag)
  end

end