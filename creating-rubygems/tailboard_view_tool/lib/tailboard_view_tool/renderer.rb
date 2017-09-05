module TailboardViewTool
  class Renderer
		def self.copyright name, msg
			"&copy; #{Time.now.year} | <b>#{name}<b>".html_safe
		end
	end
end
