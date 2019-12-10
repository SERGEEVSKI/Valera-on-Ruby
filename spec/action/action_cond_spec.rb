require_relative '../../lib/action/cond.rb'
require_relative '../../lib/character.rb'
require 'rspec'

describe Action::Cond do
  describe '#valid?' do
    let(:cond) do
      Action::Cond.new parameter: :health, operator: '<', value: 50
    end

    subject { cond.valid? character }

    context 'when the cond is valid' do
      let(:character) { Character.new health: 30 }
      it { is_expected.to be_truthy } # be true?
    end

    context 'when the cond is not valid' do
      let(:character) { Character.new health: 100 }
      it { is_expected.to be_falsey }
    end
  end
end
