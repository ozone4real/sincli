module Sincli
  module Generators
    class RootFiles < Base
      include Thor::Actions

      def generate
        set_options
        gemfile
        rackup
        gitignore
        rakefile
      end

      private

      def rackup
        template('basic/config.ru.tt', 'config.ru')
      end

      def gitignore
        copy_file('basic/.gitignore', '.gitignore')
      end

      def gemfile
        @contrib_extensions = contrib_extensions.map { |e| "sinatra/#{e}" }
        template('basic/Gemfile.tt', 'Gemfile', verbose: true)
      end

      def rakefile
        copy_file('basic/Rakefile', 'Rakefile')
      end

      def set_options
        return unless @options[:db]

        @options[:db] = case @options[:db]
                        when 'mysql'
                          'mysql2'
                        when /^postgres|pg/
                          'pg'
                        when /^sqlite/
                          'sqlite3'
                        end
      end
    end
  end
end
