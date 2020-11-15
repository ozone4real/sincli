module Sincli
  module Generators
    class Views < Base
      def self.source_root
        super.join("basic/app/views")
      end

      def generate
        template("layout.erb.tt", "views/layout.erb", verbose: true)
      end
    end
  end
end