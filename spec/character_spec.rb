require_relative '../lib/character.rb'
require 'rspec'

describe Character do
  let(:character) { Character.new(health: health, mana: mana, happiness: happiness) }
  let(:health) { 0 }
  let(:mana) { 0 }
  let(:happiness) { 0 }

  describe '#dead?' do
    subject { character.dead? }
    context 'when the character health < 0' do
      let(:health) { -5 }
      it { is_expected.to be true }
    end

    context 'when the character health > 0' do
      let(:health) { 50 }
      it { is_expected.to be false }
    end

    context 'when the character happiness > -10' do
      let(:happiness) { 5 }
      it { is_expected.to be true }
    end

    context 'when the character happiness < -10' do
      let(:happiness) { -15 }
      it { is_expected.to be true }
    end
  end

  describe '#mana=' do
    subject { character.mana }
    let(:mana) { 130 }

    it { expect(subject).to eq(100) }
    it { expect(character.health).to eq(0) }
  end
end
