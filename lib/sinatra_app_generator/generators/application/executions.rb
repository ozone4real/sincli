require "byebug"

class Generators
  class Application
    class Executions < Base
      def execute
        run("git init")
        run("bundle install")
      end
    end
  end
end