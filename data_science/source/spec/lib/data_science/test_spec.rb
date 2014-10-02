require_relative '../../spec_helper.rb'

module DataScience
  describe Test do
    let(:import_data) { { foo: :bar } }
    let(:test) { Test.new(import_data).execute }

    context 'when instantiating' do
      it 'exposes `data` hash attr_reader' do
        expect(test.data).not_to be_nil
        expect(test.data).not_to be_empty
      end
      
      it 'populates `data` hash with accurate values' do
        expect(test.data).to eq(import_data)
      end
    end

    context 'after executing' do
      it 'exposes `results` hash attr_reader' do
        expect(test.results).not_to be_nil
        expect(test.results).not_to be_empty
      end

      it 'exposes correct fields in `results` hash' do
        expect(test.results[:status]).not_to be_nil
      end

      it 'populates `results` hash with accurate values' do
        expect(test.results[:status]).to eq(:OK)
      end
    end
  end
end
