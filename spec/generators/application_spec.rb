module Sincli
  module Generators
    RSpec.describe Application do
      let(:name) { 'new app' }
      let(:options) { {} }
      let(:generator) { described_class.new(name, options) }

      context 'when --no-database flag is passed' do
        before do
          options.merge!(db: 'pg', no_database: true)
        end

        it 'should remove :db from the option' do
          expect(generator.options[:db]).to eq(nil)
        end
      end

      describe '#create_root_files' do
        subject { generator.create_root_files }
        let(:root_files) { instance_double(RootFiles, generate: nil) }

        it 'should create root directory files' do
          allow(RootFiles).to receive(:new).and_return(root_files)
          expect(RootFiles).to receive(:new).with(name, options)
          expect(root_files).to receive(:generate)
          subject
        end
      end

      describe '#create_config' do
        subject { generator.create_config }
        let(:config) { instance_double(Config, generate: nil) }

        it 'should create configuration files' do
          allow(Config).to receive(:new).and_return(config)
          expect(Config).to receive(:new).with(name, options)
          expect(config).to receive(:generate)
          subject
        end
      end

      describe '#create_root_dir' do
        subject { generator.create_root_dir }

        it 'should create the root directory' do
          allow(Dir).to receive(:mkdir)
          allow(Dir).to receive(:chdir)
          expect(Dir).to receive(:mkdir).with('new-app')
          expect(Dir).to receive(:chdir)
          subject
        end
      end

      describe '#create_views' do
        subject { generator.create_views }
        let(:views) { instance_double(Views, generate: nil) }

        before do
          allow(Views).to receive(:new).and_return(views)
        end

        context 'when api-only' do
          it 'should not create the views directory' do
            options[:api_only] = true
            expect(Views).not_to receive(:new)
            subject
          end
        end

        context 'when not api only' do
          it 'should create the views directory with files' do
            options[:api_only] = false
            expect(Views).to receive(:new)
            expect(views).to receive(:generate)
            subject
          end
        end
      end

      describe '#create_assets' do
        subject { generator.create_assets }
        let(:assets) { instance_double(Assets, generate: nil) }

        before do
          allow(Assets).to receive(:new).and_return(assets)
        end

        context 'when api-only' do
          it 'should not create the assets directory' do
            options[:api_only] = true
            expect(Assets).not_to receive(:new)
            subject
          end
        end

        context 'when not api only' do
          it 'should create the assets directory with files' do
            options[:api_only] = false
            expect(Assets).to receive(:new)
            expect(assets).to receive(:generate)
            subject
          end
        end
      end

      describe '#create_models_and_controllers' do
        subject { generator.create_models_and_controllers }
        let(:mc) { instance_double(ModelsAndControllers, generate: nil) }

        it 'should create configuration files' do
          allow(ModelsAndControllers).to receive(:new).and_return(mc)
          expect(ModelsAndControllers).to receive(:new).with(name, options)
          expect(mc).to receive(:generate)
          subject
        end
      end
    end
  end
end
