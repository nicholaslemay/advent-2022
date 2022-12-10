using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using FluentAssertions;
using Xunit;

namespace Day01Part2;

public class Part2Test
{
    [Fact]
    public void ReadsCaloriesFromSpecifiedInput()
    {
        var calories = ElvesCaloryCounts.ReadFromFile("sampleInput.txt");
        calories.Should().HaveCount(3);
        calories.First().First().Should().Be(123);
    }
    
    [Fact]
    public void ElvesKnowCalorycountPerElfCountLimitedToTop3()
    {
        var elvesCaloriesByItems = new List<List<int>>
        {
            new() { 1, 1, 1 },
            new() { 3, 3, 3 },
            new() { 2, 2, 2 },
            new() { 4, 4, 4 },
            new() { 5,5,5},
        };
        
        Elves.HighestCaloryCount(elvesCaloriesByItems).Should().Be(15 + 12 +9);
    }

}

public class ElvesCaloryCounts
{
    public static IEnumerable<List<int>> ReadFromFile(string fileName)
    {
        return File.ReadAllText(fileName)
            .Split(new string[] { "\n\n" }, StringSplitOptions.None)
            .Select(x => x.Split("\n").Select(int.Parse).ToList());
    }
}

public class Elves
{
    public static int HighestCaloryCount(IEnumerable<List<int>> elvesCaloriesByItems)
    {
        return elvesCaloriesByItems
            .Select(elveItemsCalories => elveItemsCalories.Sum())
            .OrderByDescending(x=>x)
            .Take(3)
            .Sum();
    }
}