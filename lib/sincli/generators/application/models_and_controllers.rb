class Generators
  class Application
    class ModelsAndControllers < Base

      def self.source_root
        super.join("basic/app")
      end

      def generate
        directory("models")
        directory("controllers")
      end
    end
  end
end