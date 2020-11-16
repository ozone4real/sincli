module Sincli
  module Generators
    RSpec.describe Assets do
      subject { described_class.new('new app', {}) }

      context '#generate' do
        it 'should generate the assets directory and files' do
          allow(subject).to receive(:directory)
          expect(subject).to receive(:directory).with('assets', 'assets')
          subject.generate
        end
      end
    end
  end
end
