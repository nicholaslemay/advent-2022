class Elves
  def self.total_calories_per_elf(calories_per_elf)
    calories_per_elf.map(&:sum).sort.reverse.first(3)
  end
end

class CaloryCounts
def self.from_file(filename)
  calories_per_elf = File.readlines(filename).slice_when { |l| l == "\n" }.to_a
  calories_per_elf.map{|x| x.map(&:to_i)}
end

end
RSpec.describe "Elves" do

  it 'calories count carried per elf' do
    expect(Elves.total_calories_per_elf([[1, 1, 1], [2, 2, 2], [3, 3, 3], [4,4,4],[3,3,3], [5,5,5]])).to eq([15, 12,9])
  end
end

RSpec.describe "Calory counts" do

  it 'From file' do
    expect(CaloryCounts.from_file('./Part2/day1Sample.txt').count).to eq(5)
    expect(CaloryCounts.from_file('./Part2/day1Sample.txt')[0][0]).to eq(1000)
  end
end
