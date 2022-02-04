require 'spec_helper'

RSpec.describe Screen do
  subject(:screen) { Screen.new(map: map, args: args) }

  let(:map) { Sokoban::Map.new(map_io) }
  let(:map_io) { File.read("spec/fixtures/map.txt") }
  let(:args) { GTK::Args.new }

  describe "#tick" do
    let(:new_args) { 1 }

    it 'replaces args' do
      screen.tick(new_args)

      expect(screen.args).to eq(1)
    end
  end

  describe "#show_fps" do
    it 'updates labels' do
      expect { screen.show_fps }
        .to change { args.outputs.labels.size }.by(1)
    end
  end
end
