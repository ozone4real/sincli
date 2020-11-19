module Sincli
  module Generators
    RSpec.describe Executions do
      let(:name) { 'new app' }
      let(:options) { {} }
      subject { described_class.new('new app', options) }

      describe '#execute' do
        before do
          allow(subject).to receive(:run)
          allow(subject).to receive(:insert_into_file)
        end

        it 'should run the expected commands' do
          expect(subject).to receive(:run).with('git init')
          expect(subject).to receive(:run).with('bundle install')
          expect(subject).to receive(:run).with('rspec --init')
          subject.execute
        end

        it 'should setup rspec' do
          expect(subject).to receive(:insert_into_file).with('spec/spec_helper.rb', before: "RSpec.configure do |config|\n")
          expect(subject).to receive(:insert_into_file).with('spec/spec_helper.rb', after: "RSpec.configure do |config|\n")
          subject.execute
        end
      end
    end
  end
end
