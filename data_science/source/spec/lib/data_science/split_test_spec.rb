require_relative '../../spec_helper.rb'

module DataScience
  describe SplitTest do
    let(:import_path) { "#{PROJECT_ROOT}/data/conversion_sample.json" }
    let(:options) { { importer_klass: JSONImporter, input_file: import_path } }
    let(:test) { SplitTestCalculator.execute(options) }

    let(:expected_data) do
      {
        A: { hits: 47, misses: 1302, total: 1349 },
        B: { hits: 79, misses: 1464, total: 1543 }
      }
    end

    let(:expected_results) do
      {
        status: :OK,
        confidence_level: 0.95,
        p_value: 0.03156402546059378,
        score: 4.622021107958111,
        groups: {
          A: {
            conversion: 0.034840622683469234,
            confidence_interval: [0.025055087455844, 0.04462615791109446]
          },
          B: {
            conversion: 0.05119896305897602,
            confidence_interval: [0.04020173369400816, 0.06219619242394388]
          }
        }
      }
    end

    context 'when instantiating' do
      context 'and populating sample data' do
        it 'exposes `data` hash attr_reader' do
          expect(test.data).not_to be_nil
          expect(test.data).not_to be_empty
        end

        it 'exposes correct fields in `data` hash' do
          test.data.each do |_, data_hash|
            expect(data_hash).not_to be_empty
            expect(data_hash[:hits]).not_to be_nil
            expect(data_hash[:misses]).not_to be_nil
            expect(data_hash[:total]).not_to be_nil
          end
        end

        it 'populates `data` hash with accurate values' do
          expect(test.data).to eq(expected_data)
        end
      end
    end

    context 'when executing' do
      context 'and calculating results' do
        it 'exposes `results` hash attr_reader' do
          expect(test.results).not_to be_nil
        end

        it 'exposes correct fields in `results` hash' do
          expect(test.results).not_to be_empty
          expect(test.results[:p_value]).not_to be_nil
          expect(test.results[:score]).not_to be_nil
          expect(test.results[:groups]).not_to be_empty
          test.results[:groups].each do |_, results_hash|
            expect(results_hash).not_to be_empty
            expect(results_hash[:conversion]).not_to be_nil
            expect(results_hash[:confidence_interval]).not_to be_nil
          end
        end
        
        it 'populates `results` hash with accurate values' do
          expect(test.results).to eq(expected_results)
        end
      end
    end
  end
end
