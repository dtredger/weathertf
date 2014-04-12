# included in tests via: config.include Sorcery::TestHelpers::Rails

module Sorcery
  module TestHelpers

    module Rails

      def login_with_username_and_password(user, password)
        page.driver.post(user_sessions_url, { 
          username: user,
          password: password
          })
      end


    end


  end
end
