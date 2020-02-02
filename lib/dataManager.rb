class loadData
	attr_writer :text_vector, :images_vector
	def initialize
		@text_vector = []
		@images_vector = [] # Yes, I know, but an image is not a text so I call it valid.
	end

	def loadTextVector
		@text_vector.each { |x| }
	end

	def loadImagesVector
		@images_vector.each { |x| }
	end
end

class textManager
	def initialize
		@load_data = loadData.new
	end
  
  def g

end