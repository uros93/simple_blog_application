

class Comment < ActiveResource::Base
	self.site = "http://localhost:3001/api/posts/:post_id/"
	
end