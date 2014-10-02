require_relative '../../spec_helper.rb'

module DataScience
  describe Parser do
    let(:import_path) { "#{PROJECT_ROOT}/data/conversion_sample.json" }
    let(:options) { { importer_klass: JSONImporter, input_file: import_path } }

    context 'when importing' do
      it 'delegates reading of input' do
        expect { Parser.read(options) }.not_to raise_error
      end
    end

    context 'when parsing' do
      it 'returns all valid data' do
        expect(Parser.load(options).size).to eq(2892)
      end
    end
  end
end
