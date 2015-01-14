	class RootpageController < ApplicationController
	
	
	def asd
		@contact = current_user.contact
	# raise current_user.inspect
		@current_user_contacts = current_user.contacts
	end

end