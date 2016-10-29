class Page < ActiveRecord::Base
  #serialize :images
  mount_uploaders :images, PageImagesUploader
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :text, presence: true
end
