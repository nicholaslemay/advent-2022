class Elves
  def self.with_most_calories(calory)
    calory.max
  end
end

RSpec.describe "Elves" do

  it 'know highest calories count' do
    expect(Elves.with_most_calories([2,4,1,3])).to eq(4)
  end
end