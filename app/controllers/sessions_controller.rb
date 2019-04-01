class SessionsController < Devise::SessionsController
#after_sign_in_path_for is called by devise
def after_sign_in_path_for(user)
"/signedinuserdoctor" #here we provide
#the path for the user's profile end
end
end
