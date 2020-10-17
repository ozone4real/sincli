class Generators
  class Application
    def initialize(name, options)
      @name = name
      @options = options
    end

    def create
      create_root_dir
      create_root_files
      create_config
      create_app_dir
      create_views
    end

    def create_root_files
      RootFiles.new(@name, @options).generate
    end

    def create_config
      Config.new(@name, @options).generate
    end

    def create_root_dir
      dir_name = @name.parameterize
      dir = Dir.mkdir(dir_name)
      Dir.chdir(dir_name)
    end

    def create_app_dir
      Dir.mkdir "app"
    end

    def create_views
      return if @options[:api_only]
      Views.new(@name, @options).generate
    end
  end
end