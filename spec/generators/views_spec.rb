module Sincli
  module Generators
    RSpec.describe Views do
      subject { described_class.new('new app', {}) }

      context '#generate' do
        it 'should generate the views directory and files' do
          allow(subject).to receive(:tempelate)
          expect(subject).to receive(:template).with('layout.erb.tt', 'views/layout.erb')
          subject.generate
        end
      end
    end
  end
end