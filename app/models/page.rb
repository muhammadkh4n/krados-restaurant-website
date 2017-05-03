class Page < ActiveRecord::Base
  PAGES = %w(main_top main_bottom specials about gallery menu contact_us phone email address info map)
  #serialize :images
  mount_uploaders :images, PageImagesUploader
  validates :page, presence: true, uniqueness: { case_sensitive: false }

  # All pages in a hash
  def self.pages
    pages = {}
    Page.all.each do |page|
      pages[page.page] = page
    end
    pages
  end
end
