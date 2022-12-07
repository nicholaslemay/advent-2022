using System.Collections;
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
        ElvesCaloryCounts.ReadFromFile().First().Should().Be("123");
    }
}

public class ElvesCaloryCounts
{
    public static IEnumerable<string> ReadFromFile()
    {
        return File.ReadLines("sampleInput.txt");
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