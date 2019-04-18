class Fish < ApplicationRecord
	has_many_attached :files

def thumbnails input
	return self.files[input]
end	

end
