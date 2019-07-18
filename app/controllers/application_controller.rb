class ApplicationController < ActionController::Base
      before_action :authenticate_user!
      layout :layout_by_resource
      before_action :build_profile



      def layout_by_resource
          if devise_controller?
            "devise"
          else
            "application"
          end
      end  


      def build_profile
        if current_user
          if current_user.user_profile.blank?
           current_user.build_user_profile 
          end
        end  
      end

end



