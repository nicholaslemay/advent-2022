using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using FluentAssertions;
using Xunit;

namespace Day01Part1;

public class Part1Test
{
    [Fact]
    public void ElvesKnowHighestCaloryCount()
    {
        var elvesCaloriesByItems = new List<List<int>>
        {
            new() { 1, 1, 1 },
            new() { 3, 3, 3 },
            new() { 2, 2, 2 }
        };
        Elves.HighestCaloryCount(elvesCaloriesByItems).Should().Be(9);
    }

    [Fact]
    public void ReadsCaloriesFromSpecifiedInput()
    {
        var calories = ElvesCaloryCounts.ReadFromFile("sampleInput.txt");
        calories.Should().HaveCount(3);
        calories.First().First().Should().Be(123);
    }
    
    [Fact]
    public void CanSolveSampleFromDay1()
    {
        var calories = ElvesCaloryCounts.ReadFromFile("day1Sample.txt");
        calories.Should().HaveCount(5);
        calories.First().First().Should().Be(1000);
    }
}

public class ElvesCaloryCounts
{
    public static IEnumerable<IEnumerable<int>> ReadFromFile(string fileName)
    {
        return File.ReadAllText(fileName)
            .Split(new string[] { "\n\n" }, StringSplitOptions.None)
            .Select(x => x.Split("\n").Select(int.Parse));
    }
}

public class Elves
{
    public static int HighestCaloryCount(List<List<int>> elvesCaloriesByItems)
    {
        return elvesCaloriesByItems
            .Select(elveItemsCalories => elveItemsCalories.Sum())
            .Max();
    }
}