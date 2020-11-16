module Sincli
  module Generators
    class Assets < Base
      def self.source_root
        super.join('basic/app')
      end

      def generate
        directory('assets', 'assets')
      end
    end
  end
end
