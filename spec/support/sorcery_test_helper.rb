# included in tests via: config.include Sorcery::TestHelpers::Rails

module Sorcery
  module TestHelpers

    module Rails

      def login_user_post(user, password)
        page.driver.post(sessions_url, { username: user, password: password}) 
      end

      def logout_user_get
        page.driver.get(logout_url)
      end


    end


  end
end
