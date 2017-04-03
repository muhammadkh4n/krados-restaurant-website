class RenameTitleToPageFromPages < ActiveRecord::Migration
  def change
    rename_column :pages, :title, :page
  end
end
