require "pathname"

class Generators
  class Base < Thor::Group
    include Thor::Actions

    SERVER_NAMES = %w(puma thin falcon webrick)

    def initialize(name, options)
      @name = name
      @options = options
      @options[:server] = "thin" unless SERVER_NAMES.include? options[:server]
      self.destination_root = Dir.pwd
      self.behavior = :invoke
    end

    def self.source_root
      f = File.expand_path("../templates", __dir__)
      Pathname.new f
    end

    def git_keep
      create_file(".", ".gitkeep")
    end

    def contrib_extensions
      ['reloader', 'required_params'].tap do |e|
        if @options[:api_only]
          e.push 'json'
        else
          e.push 'respond_with', 'content_for'
        end
      end
    end

    def extensions
      return contrib_extensions if @options[:api_only]
      contrib_extensions + ['flash']
    end
  end
end