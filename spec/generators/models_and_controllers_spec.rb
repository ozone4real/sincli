module Sincli
  module Generators
    RSpec.describe ModelsAndControllers do
      let(:name) { 'new app' }
      let(:options) { {} }
      subject { described_class.new('new app', options) }

      describe "#generate" do
        before do
          allow(subject).to receive(:directory)
          allow(subject).to receive(:empty_directory)
          allow(subject).to receive(:template)
        end
        
        it "should generate the controllers directory and files" do
          expect(subject).to receive(:empty_directory).with('controllers')
          allow(subject).to receive(:template).with('controllers/application_controller.rb.tt', 'controllers/application_controller.rb')
          subject.generate
        end
        context "when there is a db option" do
          it "should generate the models directory" do
            options[:db] = 'mysql'
            expect(subject).to receive(:directory).with('models')
            subject.generate
          end
        end

        context "when there is no db option" do
          it "should not generate the models directory" do
            expect(subject).not_to receive(:directory).with('models')
            subject.generate
          end
        end
      end
    end
  end
end