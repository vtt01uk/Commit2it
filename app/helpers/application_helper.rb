module ApplicationHelper
	#pass in the user object
	#Documentation on Gravatar: https://en.gravatar.com/support/
	#Gravatar urls are based on MD5 hash of the user's email
	#Ruby uses 'hexdigest' method - http://ruby-doc.org/stdlib-1.9.3/libdoc/digest/rdoc/Digest/Class.html
	def gravatar_for(user, options = {size: 80})
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
		size = options[:size]
		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
		image_tag(gravatar_url, alt: user.username, class: "img-circle")
	end
end
