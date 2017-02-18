# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Dish.destroy_all
Category.destroy_all
Branch.destroy_all
Admin.destroy_all
Page.destroy_all

admin = Admin.new(username: 'admin', password: 'mk12345')
admin.save

Page.create!([{
    title: "about",
    text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut lectus a lorem faucibus aliquet. Morbi ut lectus libero. Sed porttitor in orci non commodo. Aenean ut vehicula nunc, non tempor leo. Vestibulum et tellus aliquet, ullamcorper risus quis, laoreet leo. Phasellus luctus sem eget quam commodo, ac volutpat ex mattis. Nam in urna ut massa imperdiet vulputate in sit amet augue. Etiam purus lorem, hendrerit id est ac, euismod interdum quam.\r\n\r\nAenean vestibulum egestas purus, nec gravida turpis cursus vitae. Aliquam non ex maximus, sollicitudin odio vel, viverra tortor. Aliquam bibendum libero quis metus eleifend sagittis. Vivamus rhoncus quam ac tellus suscipit commodo. Aenean scelerisque semper eros sit amet fermentum. Donec vel rhoncus lectus. Sed a sapien rutrum, imperdiet massa vel, dignissim lectus."
  },
  {
    title: "mission",
    text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer ut lectus a lorem faucibus aliquet. Morbi ut lectus libero. Sed porttitor in orci non commodo. Aenean ut vehicula nunc, non tempor leo. Vestibulum et tellus aliquet, ullamcorper risus quis, laoreet leo. Phasellus luctus sem eget quam commodo, ac volutpat ex mattis. Nam in urna ut massa imperdiet vulputate in sit amet augue. Etiam purus lorem, hendrerit id est ac, euismod interdum quam.\r\n\r\nAenean vestibulum egestas purus, nec gravida turpis cursus vitae. Aliquam non ex maximus, sollicitudin odio vel, viverra tortor. Aliquam bibendum libero quis metus eleifend sagittis. Vivamus rhoncus quam ac tellus suscipit commodo. Aenean scelerisque semper eros sit amet fermentum. Donec vel rhoncus lectus. Sed a sapien rutrum, imperdiet massa vel, dignissim lectus."
  },
  {
    title: "phone",
    text: "+92-345-1235321\r\n\r\n+92-23-43453451"
  },
  {
    title: "email",
    text: "info@krados.com"
  },
  {
    title: "address",
    text: "Krados Restautant, 1-C/1, Moon Market, Faisal Town, Lahore\r\n\r\nKrados Family Dining, Moon Market, Faisal Town, Lahore\r\n\r\n34-A, Block F/1, Opposite LDA Office, Johar Town, Lahore"
  }
])
