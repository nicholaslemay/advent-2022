using System.Collections.Generic;
using System.Linq;
using FluentAssertions;
using Xunit;

namespace Day01Part1;

public class Part1Test
{
    [Fact]
    public void ElvesKnowHighestCaloryCount()
    {
        Elves.HighestCaloryCount(new List<int>{123}).Should().Be(123);
    }
}

public class Elves
{
    public static int HighestCaloryCount(List<int> calories)
    {
        return calories.First();
    }
}