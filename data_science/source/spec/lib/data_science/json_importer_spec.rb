require_relative '../../spec_helper.rb'

module DataScience
  describe JSONImporter do
    let(:import_path) { "#{PROJECT_ROOT}/data/conversion_sample.json" }

    context 'when importing' do
      it 'loads the input data' do
        data = JSONImporter.load(import_path)
        expect(data.size).to eq(2892)
      end
    end
  end
end
