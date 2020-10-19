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
  end
end