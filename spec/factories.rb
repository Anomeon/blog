FactoryGirl.define do
  
  # Association отключены, т.к. теряется смысл проверки связей
  # Как проверять, если мы не проверяем определенный функционал, например, связь поста с тэгом, нужно ли создавать связи с пользователем? иначе у поста user_id = nil
  # Правильно ли я проверяю связь комментария с постом и пользователем? в файле post_spec есть тест "Checks association post with comment" в котором я устанавливаю связь отдельно user1.comments << comment1 post1.comments << comment1. Хотя по routes у меня вложенность user1>post1>comment1 Нужно ли и тесты писать таким же образом.

  factory :user do
    sequence(:email) { |i| "email#{i}@email.com" }
    password "password"
    password_confirmation "password"
  end

  factory :post do
    title "Just another title"
    text "Just another text"
    # association(:user)
  end

  factory :comment do
    body "Just another comment"
    # association(:user)
    # association(:post)
  end

  factory :tag do
    tag_text "Just another tag"
  end

  factory :category do
    # association(:post)
    # association(:tag)
  end

end