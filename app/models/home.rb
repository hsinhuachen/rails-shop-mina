class Home < ApplicationRecord
	mount_uploader :image, HomeUploader

	default_scope -> { order('sorting DESC') }

	def status
		self.publish
	end
end
