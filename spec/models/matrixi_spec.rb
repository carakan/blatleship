require 'rails_helper'

describe Matrixi do

  it "Define a correct matrix" do
    matrix = Matrixi.new
    expect(matrix.check_matrix).to equal(100)
  end

  it "Define and fill with navies" do
    matrix = Matrixi.new
    matrix.fill_with_navies
    expect(matrix.check_navies).to equal(20)
  end

  it "Define an attack" do
    matrix = Matrixi.new(3)
    expect(matrix.check_blank).to equal(9)
    matrix.set_value(1,1,1)
    expect(matrix.check_navies).to equal(1)
    expect(matrix.check_blank).to equal(8)

    matrix.attacked(0, 0)
    expect(matrix.check_navies).to equal(1)
    expect(matrix.check_blank).to equal(7)
    expect(matrix.check_navies_destroyed).to equal(0)
    expect(matrix.check_blank_used).to equal(1)

    matrix.attacked(0, 1)
    matrix.attacked(0, 2)
    matrix.attacked(1, 0)
    matrix.attacked(1, 2)
    matrix.attacked(2, 0)
    matrix.attacked(2, 1)
    matrix.attacked(2, 2)

    expect(matrix.check_navies).to equal(1)
    expect(matrix.check_blank).to equal(0)
    expect(matrix.check_navies_destroyed).to equal(0)
    expect(matrix.check_blank_used).to equal(8)
    expect(matrix.lost?).to equal(false)

    matrix.attacked(1, 1)

    expect(matrix.lost?).to equal(true)
  end
end
