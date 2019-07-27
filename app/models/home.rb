class Home < ApplicationRecord
	mount_uploader :image, HomeUploader
end
