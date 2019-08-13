class Gallery < ApplicationRecord
	belongs_to :product
	mount_uploader :filename, GalleryUploader
end
