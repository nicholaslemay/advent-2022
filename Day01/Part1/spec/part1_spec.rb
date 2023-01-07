class Elves
  def self.with_most_calories(calory)
    calory
  end
end

RSpec.describe "Elves" do

  it 'know highest calories count' do
    expect(Elves.with_most_calories(172)).to eq(172)
  end
end