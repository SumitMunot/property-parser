module Requests
	module JsonHelpers
		# This method finds the json responce.
		def json
			@json ||= JSON.parse(response.body)
		end
	end
end
