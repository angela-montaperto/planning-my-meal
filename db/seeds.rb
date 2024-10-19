puts "starting to seed the database"
1.times do
  user=User.new(
    name: Faker::Name.first_name,
    surname: Faker::Name.last_name,
    email: 'admin@mail.it',
    role: Role::ADMIN,
    password: 'password',
    password_confirmation: 'password',
    confirmed_at: Time.now.utc,
    confirmation_sent_at: Time.now.utc
  )
  user.skip_confirmation!
  user.save!
end
20.times do
  user=User.new(
    name: Faker::Name.first_name,
    surname: Faker::Name.last_name,
    email: Faker::Internet.email,
    role: Role::USER,
    password: 'password',
    password_confirmation: 'password',
    confirmed_at: Time.now.utc,
    confirmation_sent_at: Time.now.utc
  )
  user.skip_confirmation!
  user.save!
end

FoodGroup.create!([
  {group_name: 'I Gruppo', name: 'Carne, pesce e uova', code: '01'},
  {group_name: 'II Gruppo', name: 'Latte e derivati', code: '02'},
  {group_name: 'III Gruppo', name: 'Cereali e tuberi', code: '03'},
  {group_name: 'IV Gruppo', name: 'Legumi', code: '04'},
  {group_name: 'V Gruppo', name: 'Grassi e oli da condimento', code: '05'},
  {group_name: 'VI Gruppo', name: 'Ortaggi e frutta, fonti di vit. A', code: '06'},
  {group_name: 'VII Gruppo', name: 'Ortaggi e frutta, fonti di vit. C', code: '07'}
])

puts "finished seeding the database"
