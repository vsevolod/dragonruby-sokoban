require 'spec_helper'

RSpec.describe Sokoban do
  let(:map) { double(Sokoban::Map, hero: 1, boxes: [], goals: []) }

  context 'when proc has map' do
    subject(:instance) do
      described_class.new do |c|
        c.map = map
      end
    end

    it { expect(instance.map).to eq(map) }
    it { expect(instance).not_to be_finished }
  end
end
