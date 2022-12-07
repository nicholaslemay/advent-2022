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
        Elves.HighestCaloryCount(new List<List<int>>{new (){1},new(){3},new(){2}}).Should().Be(3);
    }
}

public class Elves
{
    public static int HighestCaloryCount(List<List<int>> calories)
    {
        return calories.Select(x=>x.First()).Max();
    }
}