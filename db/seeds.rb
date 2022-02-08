# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


AmazonPage.create([
  { url: "https://www.amazon.com/s?k=pokemon+legends+arceus+nintendo+switch&crid=2AU3QKHGPCY5J&sprefix=pokemon%2Caps%2C320&ref=nb_sb_ss_ts-doa-p_1_7" },
  { url: "https://www.amazon.com/s?k=pokemon+legends+arceus+nintendo+switch&crid=2AU3QKHGPCY5J&sprefix=pokemon%2Caps%2C320&ref=nb_sb_ss_ts-doa-p_1_7" },
  { url: "https://www.amazon.com/s?k=pokemon+legends+arceus+nintendo+switch&crid=2AU3QKHGPCY5J&sprefix=pokemon%2Caps%2C320&ref=nb_sb_ss_ts-doa-p_1_7" },
  { url: "https://www.amazon.com/s?k=pokemon+legends+arceus+nintendo+switch&crid=2AU3QKHGPCY5J&sprefix=pokemon%2Caps%2C320&ref=nb_sb_ss_ts-doa-p_1_7" },
  { url: "https://www.amazon.com/s?k=pokemon+legends+arceus+nintendo+switch&crid=2AU3QKHGPCY5J&sprefix=pokemon%2Caps%2C320&ref=nb_sb_ss_ts-doa-p_1_7" },
  { url: "https://www.amazon.com/s?k=pokemon+legends+arceus+nintendo+switch&crid=2AU3QKHGPCY5J&sprefix=pokemon%2Caps%2C320&ref=nb_sb_ss_ts-doa-p_1_7" }
])

User.create!(email: 'admin@email.com' , password: 'admin1234' , password_confirmation: 'admin1234')
