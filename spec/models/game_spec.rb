require 'rails_helper'

describe Game do
  it "Define a game" do
    game = Game.new()
    expect(game.player_1_won?).to equal(false)
    expect(game.player_2_won?).to equal(false)
  end

  it "play a very basic game" do
    game = Game.new(3, 0)
    game.player_1.set_value(1,1,1)
    game.player_2.set_value(1,1,1)
    expect(game.player_1.check_navies).to eq(1)
    expect(game.player_1.check_blank).to eq(8)
    expect(game.player_2.check_navies).to eq(1)
    expect(game.player_2.check_blank).to eq(8)

    expect(game.play(1,0,0)).to eq(false)
    expect(game.play(2,0,0)).to eq(false)
    expect(game.play(1,0,1)).to eq(false)
    expect(game.play(2,0,1)).to eq(false)
    expect(game.play(1,0,2)).to eq(false)
    expect(game.play(2,1,1)).to eq(true)
    expect(game.player_1_won?).to eq(false)
    expect(game.player_2_won?).to eq(true)
  end
end
