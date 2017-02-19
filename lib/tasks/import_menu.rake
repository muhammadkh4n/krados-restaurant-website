require "csv"

namespace :import do
  desc "Import dishes from csv"
  task :menu_johar => :environment do
    options = {
      :headers => true
    }
    path = File.join(Rails.root, "db", "data", "menu_johar.csv")

    Dish.destroy_all
    Category.destroy_all
    Branch.destroy_all
    CSV.foreach(path, options) do |row|
      Dish.create!({
        name: row["name"],
        price: row["price"],
        category: Category.find_or_create_by!(name: row["category"]),
        branch: Branch.find_or_create_by!(name: row["branch"])
      })
    end
  end
end
