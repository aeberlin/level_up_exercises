# rubocop:disable all
require_relative '../../../support/spec_helper.rb'

module Overlord
  describe Bomb do
    activation_code, deactivation_code = '3333', '6666'
    default_activation_code, default_deactivation_code = '1234', '0000'

    bomb = Bomb.boot!(activation_code)

    context 'when instantiating' do
      it 'booting returns a new bomb' do
        expect(bomb).to be_a(Bomb)
      end
      it 'sets the default activation code' do
        expect(Bomb.new.send(:authenticate, default_activation_code)).to be_truthy
      end
      it 'accepts an activation code' do
        expect(bomb.send(:authenticate, activation_code)).to be_truthy
      end
    end

    context 'after booting' do
      it 'is deactivated and exposes non-sensitive fields' do
        expect(bomb.attempts).to eq(0)
        expect(bomb.time).to be_nil
        expect(bomb).to be_inactive
      end
    end

    context 'when activating' do
      it 'authenticates with the default activation code' do
        b = Bomb.new
        expect(b.send(:authenticate, default_activation_code)).to be_truthy
      end
      it 'authenticates with the provided activation code' do
        expect(bomb.send(:authenticate, activation_code)).to be_truthy
      end
      it 'sets the default deactivation code' do
        b = Bomb.new
        b.activate!(default_activation_code)
        expect(b.send(:authenticate, default_deactivation_code)).to be_truthy
      end
      it 'accepts a deactivation code' do
        bomb.activate!(activation_code, deactivation_code)
        expect(bomb.send(:authenticate, deactivation_code)).to be_truthy
      end
      it 'is no longer inactive' do
        expect(bomb.inactive?).to be_falsey
        expect(bomb.active?).to be_truthy
      end
      it 'explodes when you attempt to reboot it' do
        b = bomb.clone
        expect { b.reboot! }.to raise_error
      end
    end

    context 'when deactivating' do
      it 'explodes after 3 failed attempts' do
        b = bomb.clone
        do_boom = proc do
          3.times { b.deactivate!('9999') }
        end
        expect(&do_boom).to raise_error
      end
      it 'accepts the code and disarms' do
        bomb.deactivate!(deactivation_code)
        expect(bomb.inactive?).to be_truthy
        expect(bomb.active?).to be_falsey
      end
    end

    context 'when rebooting' do
      it 'accepts an activation code' do
        new_code = '9999'
        bomb.reboot!(new_code)
        expect(bomb.send(:authenticate, new_code)).to be_truthy
      end
      it 'resets metadata' do
        expect(bomb.attempts).to eq(0)
        expect(bomb.time).to be_nil
        expect(bomb.status).to eq(:deactivated)
      end
    end
  end
end
# rubocop:enable all
