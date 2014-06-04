# Encoding: utf-8

require 'appium_lib'

# selenium connect
class SeleniumConnect
  # Runner
  class Runner
    # Appium runner
    class AppiumLib
      attr_reader :config

      def initialize(config)
        @config = config
      end

      def launch
        init_browser
      end

      private

      def get_credentials
        ENV['SAUCE_USERNAME'] = config.sauce_username
        ENV['SAUCE_ACCESS_KEY'] = config.sauce_api_key
      end

      def init_browser
        get_credentials
        config_hash = config.sauce_opts.marshal_dump
        config_hash['name'] = config_hash[:job_name]
        config_hash.delete :job_name

        capabilities = { caps: config_hash  }
        Appium::Driver.new(capabilities).start_driver
      end

    end # Appium
  end # Runner
end # SeleniumConnect
