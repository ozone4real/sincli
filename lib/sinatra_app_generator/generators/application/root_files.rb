class Generators
  class Application
    class RootFiles < Base
      include Thor::Actions

      def generate
        set_options
        gemfile
        rackup
        gitignore
      end

      private

      def rackup
        copy_file("basic/config.ru", "config.ru")
      end

      def gitignore
        copy_file("basic/.gitignore", ".gitignore")
      end

      def gemfile
        template("basic/Gemfile.tt", "Gemfile", verbose: true)
      end

      def set_options
        @options[:db] = case @options[:db]
                        when "mysql"
                          "mysql2"
                        when /^postgres|pg/
                          "pg"
                        when /^sqlite/
                          "sqlite3"
                        end
      end
    end
  end
end