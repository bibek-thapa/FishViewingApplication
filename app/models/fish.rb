class Fish < ApplicationRecord
	has_many_attached :files
	scope :with_eager_loaded_images, -> { eager_load(images_attachments: :blob) }

end
