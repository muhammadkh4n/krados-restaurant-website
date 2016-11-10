class SliderController < BaseController
  def index
    @branches = Branch.all
  end

  def show
    branch = Branch.find(params[:id])
    @branch = branch.group_dishes_by_category
  end
end
