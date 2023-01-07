class Elves
  def self.calories_carried_by_top_elfs(calories_per_elf)
    total_cals_per_elf = calories_per_elf.map(&:sum)
    total_cals_per_elf.sort.reverse.first(3).sum
  end
end

class CaloryCounts
def self.from_file(filename)
  calories_per_elf = File.readlines(filename).slice_when { |l| l == "\n" }.to_a
  calories_per_elf.map{|x| x.map(&:to_i)}
end

end
RSpec.describe "Elves" do

  it 'knows how many calories are carried by the top elves' do
    expect(Elves.calories_carried_by_top_elfs([[1, 1, 1], [2, 2, 2], [3, 3, 3], [4, 4, 4], [3, 3, 3], [5, 5, 5]])).to eq(15 + 12 + 9)
  end
end

RSpec.describe "Calory counts" do

  it 'From file' do
    expect(CaloryCounts.from_file('./Part2/day1Sample.txt').count).to eq(5)
    expect(CaloryCounts.from_file('./Part2/day1Sample.txt')[0][0]).to eq(1000)
  end
end

RSpec.describe "Day01" do

  it 'Can solve sample ' do
    calory_count = CaloryCounts.from_file('./Part2/day1Sample.txt')
    expect(Elves.calories_carried_by_top_elfs(calory_count)).to eq(45000)
  end

  it 'Can solve my input' do
    calory_count = CaloryCounts.from_file('./Part2/myPuzzleInput.txt')
    expect(Elves.calories_carried_by_top_elfs(calory_count)).to eq(209481)
  end
end
