require_relative '../../spec_helper.rb'

module DataScience
  describe Calculator do
    let(:import_path) { "#{PROJECT_ROOT}/data/conversion_sample.json" }
    let(:test) { Calculator.execute(input_file: import_path) }

    context 'when executing' do
      it 'returns a populated Test object' do
        expect(test).to be_a(Test)
        expect(test.data).not_to be_empty
        expect(test.results).not_to be_empty
      end
    end
  end
end
