module Sincli
  module Generators
    class Views < Base
      def self.source_root
        super.join('basic/app/views')
      end
      private_class_method :source_root

      def generate
        template('layout.erb.tt', 'views/layout.erb')
      end
    end
  end
end
