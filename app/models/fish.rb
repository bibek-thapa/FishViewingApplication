class Fish < ApplicationRecord
	has_many_attached :files
	scope :with_eager_loaded_images, -> { eager_load(images_attachments: :blob) }
	validates:genus,presence:true,length:{minimum:5,maximum:120}
	validates:description,presence:true,length:{minimum:5,maximum:120}
	validates:commonname,presence:true,length:{minimum:5,maximum:120}
	validate:image_type

	private 
	def image_type
		if files.attached? == false
			errors.add(:files,"are missing")

		end

		files.each do |file|
				if !file.content_type.in?(%('image/jpeg image/png'))
					errors.add(:files,"should be a jpeg or png")
				end	
		end
	end

end
