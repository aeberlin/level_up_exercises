require_relative '../../spec_helper.rb'

module DataScience
  klass = Calculator
  test_klass = Test
  describe klass do
    OPTIONS = {
      input_file: "#{PROJECT_ROOT}/data/conversion_sample.json"
    }

    me = klass.execute(OPTIONS)

    context 'when executing' do
      it "returns #{test_klass} object" do
        expect(me).to be_a(test_klass)
      end

      # FIXME: These tests may be redundant
      context "returns #{test_klass} object" do
        it 'with populated data' do
          expect(me.data).not_to be_empty
        end

        it 'with populated results' do
          expect(me.results).not_to be_empty
        end
      end
    end
  end
end