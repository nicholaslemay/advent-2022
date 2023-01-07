class Elves
  def self.with_most_calories(calories)
    calories.map(&:sum).max
  end
end

RSpec.describe "Elves" do

  it 'know highest calories count' do
    expect(Elves.with_most_calories([[1,1,1],[2,2,2],[3,3,3]])).to eq(9)
  end
end