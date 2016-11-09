class Page < ActiveRecord::Base
  serialize :images
  mount_uploaders :images, PageImagesUploader
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :text, presence: true

  # All pages in a hash
  def self.pages
    pages = {}
    Page.all.each do |page|
      pages[page.title] = page
    end
    pages
  end
end
