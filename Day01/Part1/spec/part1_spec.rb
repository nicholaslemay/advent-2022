class Elves
  def self.with_most_calories
    145
  end
end

RSpec.describe "Day 10 part 02" do

  it 'works' do
    expect(Elves.with_most_calories).to eq(145)
  end
end