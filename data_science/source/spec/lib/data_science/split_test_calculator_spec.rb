require_relative '../../spec_helper.rb'

module DataScience
  describe SplitTestCalculator do
    let(:import_path) { "#{PROJECT_ROOT}/data/conversion_sample.json" }
    let(:options) { { importer_klass: JSONImporter, input_file: import_path } }
    let(:test) { SplitTestCalculator.execute(options) }

    context 'when executing' do
      it 'returns a populated SplitTest object' do
        expect(test).to be_a(SplitTest)
        expect(test.data).not_to be_empty
        expect(test.results).not_to be_empty
      end
    end
  end
end
