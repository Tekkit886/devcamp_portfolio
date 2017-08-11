module Placeholder
	extend activeSupport::Concern

	def self.image_generator(height:, width:)
		"http://via.placeholder.com/#{height}x#{width}"
end