class AddShowDescriptionToDishes < ActiveRecord::Migration
  def change
    add_column :dishes, :show_description, :boolean, default: true
  end
end
