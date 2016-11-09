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

admin = Admin.new(username: ENV['ADMIN'], password: ENV["ADMIN_PASS"])
admin.save
