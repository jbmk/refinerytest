module NavigationHelpers
  module Refinery
    module Fieldtrips
      def path_to(page_name)
        case page_name
        when /the list of fieldtrips/
          admin_fieldtrips_path

         when /the new fieldtrip form/
          new_admin_fieldtrip_path
        else
          nil
        end
      end
    end
  end
end
