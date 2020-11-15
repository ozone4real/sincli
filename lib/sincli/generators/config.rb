module Sincli
  module Generators
    class Config < Base

      def generate
        Dir.mkdir("config")
        sec_key
        db_config
        environment
        puma_config
        locales
      end

      private

      def self.source_root
        super.join("basic/config")
      end

      def sec_key
        begin
          require 'securerandom'
          sec_key =  SecureRandom.hex(64)
        rescue LoadError, NotImplementedError
          # SecureRandom raises a NotImplementedError if no random device is available
          sec_key = "%064x" % Kernel.rand(2**256-1)
        end
        create_file("config/.secret_key", sec_key)
      end

      def db_config
        return unless db = @options[:db]
        @options[:adapter] = db == "pg" ? "postgresql" : db 
        template("database.yml.tt", "config/database.yml")
      end

      def puma_config
        return unless @options[:server] == "puma"
        copy_file("puma.rb", "config/puma.rb")
      end

      def environment
        copy_file("environment.rb", "config/environment.rb")
        @extensions = extensions.map {|e| "Sinatra::#{e.camelize}" }
        template("application.rb.tt", "config/application.rb")
      end

      def locales
        directory("locales", "config/locales")
      end
    end
  end
end