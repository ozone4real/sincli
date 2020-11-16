require 'pathname'

module Sincli
  module Generators
    class Base < Thor::Group
      include Thor::Actions
      attr_reader :options, :name

      def initialize(name, options)
        @name = name
        @options = options
        self.destination_root = Dir.pwd
        self.behavior = :invoke
      end

      private

      def git_keep
        create_file('.', '.gitkeep')
      end

      def contrib_extensions
        return [] if options[:no_contrib]

        %w[reloader required_params].tap do |e|
          if @options[:api_only]
            e.push 'json'
          else
            e.push 'respond_with', 'content_for'
          end
        end
      end

      def extensions
        return contrib_extensions if options[:api_only]

        contrib_extensions + ['flash']
      end

      def self.source_root
        f = File.expand_path('../templates', __dir__)
        Pathname.new f
      end
    end
  end
end
