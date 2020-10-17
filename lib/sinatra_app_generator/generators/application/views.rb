class Generators
  class Application
    class Views < Base

      def self.source_root
        super.join("basic/app/views")
      end

      def generate
        template("layout.html.erb.tt", "app/views/layout.html.erb", verbose: true)
      end
    end
  end
end