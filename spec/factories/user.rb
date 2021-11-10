FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    # password_confirmation {password}
    # password               {Faker::Internet.password(min_length: 6)}
    # password               {'aaa111'}
    password_confirmation  {password}
    first_name            {'太郎'}
    last_name             {'山田'}
    first_name_kana       {'ヤマダ'}
    last_name_kana        {'タロウ'}
    birthday              {'1970-02-02'}
  end
end