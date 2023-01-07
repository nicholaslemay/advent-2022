class Elves
  def self.with_most_calories(calories_per_elf)
    calories_per_elf.map(&:sum).max
  end
end

class CaloryCounts
def self.from_file(filename)
  File.readlines(filename)
end

end
RSpec.describe "Elves" do

  it 'know highest calories count carried per elf' do
    expect(Elves.with_most_calories([[1,1,1],[2,2,2],[3,3,3]])).to eq(9)
  end
end

RSpec.describe "Calory counts" do

  it 'From file' do
    expect(CaloryCounts.from_file('./Part1/day1Sample.txt').count).to eq(14)
  end
end