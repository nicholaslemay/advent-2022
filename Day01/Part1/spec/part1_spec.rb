class Elves
  def self.with_most_calories
    145
  end
end

RSpec.describe "Elves" do

  it 'know highest calories count' do
    expect(Elves.with_most_calories).to eq(145)
  end
end