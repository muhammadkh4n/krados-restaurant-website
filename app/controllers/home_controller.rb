class HomeController < ApplicationController
  skip_before_action :ensure_login
  before_action :krados, :krados_grill, :specials, :about, :mission, :contact

  def index
  end

  private
    def krados
      branch = Branch.find_by(name: "Krados")
      @krados = {}
      if branch
        branch.dishes.each do |dish|
          if @krados[dish.category_name].nil?
            @krados[dish.category_name] = [dish]
          else
            @krados[dish.category_name] << dish
          end
        end
      end
    end

    def krados_grill
      branch = Branch.find_by(name: "Krados Grill")
      @krados_grill = {}
      if branch
        branch.dishes.each do |dish|
          if @krados_grill[dish.category_name].nil?
            @krados_grill[dish.category_name] = [dish]
          else
            @krados_grill[dish.category_name] << dish
          end
        end
      end
    end

    def specials
      dish = Dish.where(special: true)
      if dish
        @specials = dish
      else
        @specials = Dish.new
      end
    end

    def about
      page = Page.find_by(title: "about")
      if page
        @about = page
      else
        @about = Page.new
      end
    end

    def mission
      page = Page.find_by(title: "mission")
      if page
        @mission = page
      else
        @mission = Page.new
      end
    end

    def contact
      phone = Page.find_by(title: "phone")
      address = Page.find_by(title: "address")
      contact_text = Page.find_by(title: "info")

      if phone
        @phone = phone
      else
        @phone = Page.new
      end

      if address
        @address = address
      else
        @address = Page.new
      end

      if contact_text
        @contact_text = contact_text
      else
        @contact_text = Page.new
      end
    end
end
