require_relative '../../spec_helper.rb'

module DataScience
  describe Importer do
    let(:import_path) { "#{PROJECT_ROOT}/data/conversion_sample.json" }

    context 'when importing' do
      it 'finds the input file' do
        expect { Importer.read(import_path) }.not_to raise_error
      end

      it 'loads the input data' do
        data = Importer.load(import_path)
        expect(data).not_to be_empty
      end
    end
  end
end
