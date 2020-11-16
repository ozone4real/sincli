module Sincli
  module Generators
    class ModelsAndControllers < Base
      def self.source_root
        super.join('basic/app')
      end
      private_class_method :source_root

      def generate
        directory('models') if @options[:db]
        empty_directory('controllers')
        template('controllers/application_controller.rb.tt', 'controllers/application_controller.rb')
      end
    end
  end
end
