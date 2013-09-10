module Guard
  class EUnit
    module Formatter

      GREEN_COLOR_CODE = ';32'
      RED_COLOR_CODE   = ';31'

      class << self
         def success(message, options = {})
           ::Guard::UI.info(color(message, GREEN_COLOR_CODE), options)
         end

         def error(message, options = {})
           ::Guard::UI.info(color(message, RED_COLOR_CODE), options)
         end

         private

         def color(text, color_code)
           ::Guard::UI.send(:color_enabled?) ? "\e[0#{ color_code }m#{ text }\e[0m" : text
         end
      end
    end
  end
end
