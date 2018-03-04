class UploaderController < BaseController
  require 'spreadsheet'

  def create
    menu = uploader_params[:menu]
    fileType = menu.original_filename.split(/\.(\w+)$/)[1]
    if fileType == 'xls'
      book = Spreadsheet.open menu.tempfile.path
      sheet = book.worksheet 0
      Dish.destroy_all
      Category.destroy_all
      Branch.destroy_all
      sheet.each 1 do |row|
        Dish.create!({
          name: row[0],
          price: row[1],
          category: Category.find_or_create_by!(name: row[2]),
          branch: Branch.find_or_create_by!(name: row[3])
        })
      end
      redirect_to dishes_path, notice: 'Menu upload success.'
    else
      redirect_to dishes_path, notice: 'Invalid file formal.'
    end
  end

  private
    def uploader_params
      params.permit(:menu)
    end
end