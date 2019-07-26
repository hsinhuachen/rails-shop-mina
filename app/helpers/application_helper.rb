module ApplicationHelper
	def current_class?(path)
    	'active' if request.path == path
  	end
end
