class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist
  include SetSource
  include CurrentUserConcern
  include DefaultPageContent

  before_action :set_copyright

  def set_copyright
  	@copyright = TailboardViewTool::Renderer.copyright 'Brian Martin', 'All Rights reserved'
  end
end

module TailboardViewTool
	class Renderer
		def self.copyright name, msg
			"&copy; #{Time.now.year} | <b>#{name}<b>".html_safe
		end
	end
end

