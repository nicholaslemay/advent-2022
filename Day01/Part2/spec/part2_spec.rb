class Elves
  def self.with_most_calories(calories_per_elf)
    calories_per_elf.map(&:sum).max
  end
end

class CaloryCounts
def self.from_file(filename)
  calories_per_elf = File.readlines(filename).slice_when { |l| l == "\n" }.to_a
  calories_per_elf.map{|x| x.map(&:to_i)}
end

end
RSpec.describe "Elves" do

  it 'know highest calories count carried per elf' do
    expect(Elves.with_most_calories([[1,1,1],[2,2,2],[3,3,3]])).to eq(9)
  end
end

RSpec.describe "Calory counts" do

  it 'From file' do
    expect(CaloryCounts.from_file('./Part2/day1Sample.txt').count).to eq(5)
    expect(CaloryCounts.from_file('./Part2/day1Sample.txt')[0][0]).to eq(1000)
  end
end
