require_relative '../../spec_helper.rb'

module DataScience
  describe SplitTestParser do
    let(:import_path) { "#{PROJECT_ROOT}/data/conversion_sample.json" }
    let(:options) { { importer_klass: JSONImporter, input_file: import_path } }

    let(:expected_data) do
      {
        A: { hits: 47, misses: 1302, total: 1349 },
        B: { hits: 79, misses: 1464, total: 1543 }
      }
    end

    context 'when parsing' do
      it 'returns all valid data' do
        expect(SplitTestParser.load(options)).to eq(expected_data)
      end
    end
  end
end
