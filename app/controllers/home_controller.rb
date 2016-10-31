class HomeController < ApplicationController
  skip_before_action :ensure_login
  before_action :menu, :specials, :pages
  helper_method :hyphenate

  def index
    @message = PointlessFeedback::Message.new
  end

  private
    def menu
      @branches = Branch.group_dishes_by_category
    end

    def specials
      @specials = Dish.special_dishes
    end

    def pages
      @pages = Page.pages
    end

    def hyphenate(string)
      string.downcase.gsub(/\s+/, "-")
    end
end
