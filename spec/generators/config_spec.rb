module Sincli
  module Generators
    RSpec.describe Config do
      let(:name) { 'new app' }
      let(:options) { {} }
      subject { described_class.new('new app', options) }

      describe '#sec_key' do
        it 'should generate a random key and save to a file' do
          allow(subject).to receive(:create_file)
          expect(SecureRandom).to receive(:hex).and_return('xhdk')
          expect(subject).to receive(:create_file).with('config/.secret_key', 'xhdk')
          subject.sec_key
        end
      end

      describe '#db_config' do
        context 'when there is no db option' do
          it 'should not create a db config' do
            allow(subject).to receive(:template)
            expect(subject).not_to receive(:template).with('database.yml.tt', 'config/database.yml')
            subject.db_config
            expect(subject.options[:adapter]).to eq(nil)
          end
        end

        context 'when there is a db option' do
          before do
            options[:db] = 'pg'
            allow(subject).to receive(:template)
          end

          it 'should create a db config' do
            expect(subject).to receive(:template).with('database.yml.tt', 'config/database.yml')
            subject.db_config
          end

          it 'should set the adapter' do
            subject.db_config
            expect(subject.options[:adapter]).to eq('postgresql')
          end
        end
      end

      describe '#puma_config' do
        context 'when the server option is not puma' do
          it 'should not create a puma config' do
            options[:server] = 'thin'
            allow(subject).to receive(:copy_file)
            expect(subject).not_to receive(:copy_file).with('puma.rb', 'config/puma.rb')
            subject.puma_config
          end
        end

        context 'when the server option is puma' do
          it 'should create a puma config' do
            options[:server] = 'puma'
            allow(subject).to receive(:copy_file)
            expect(subject).to receive(:copy_file).with('puma.rb', 'config/puma.rb')
            subject.puma_config
          end
        end
      end

      describe '#environment' do
        before do
          allow(subject).to receive(:copy_file)
          allow(subject).to receive(:template)
        end

        it 'should set up the application and environment config' do
          expect(subject).to receive(:copy_file).with('environment.rb', 'config/environment.rb')
          expect(subject).to receive(:template).with('application.rb.tt', 'config/application.rb')
          subject.environment
        end

        it 'should set up the expected extensions' do
          subject.environment
          extensions = [
            'Sinatra::Reloader', 'Sinatra::RequiredParams', 'Sinatra::RespondWith',
            'Sinatra::ContentFor', 'Sinatra::Flash'
          ]
          expect(subject.instance_variable_get(:@extensions)).to eq(extensions)
        end

        context 'when --api-only flag is passed' do
          it 'should setup the expected extensions' do
            options[:api_only] = true
            subject.environment
            extensions = ['Sinatra::Reloader', 'Sinatra::RequiredParams', 'Sinatra::JSON']
            expect(subject.instance_variable_get(:@extensions)).to eq(extensions)
          end
        end

        context 'when --no-contrib flag is passed' do
          it 'should setup the expected extensions' do
            options[:no_contrib] = true
            subject.environment
            extensions = ['Sinatra::Flash']
            expect(subject.instance_variable_get(:@extensions)).to eq(extensions)
          end
        end
      end

      describe '#locales' do
        it 'should setup the locales directory' do
          allow(subject).to receive(:directory)
          expect(subject).to receive(:directory).with('locales', 'config/locales')
          subject.locales
        end
      end
    end
  end
end
