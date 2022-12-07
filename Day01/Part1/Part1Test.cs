using FluentAssertions;
using Xunit;

namespace Day01Part1;

public class Part1Test
{
    [Fact]
    public void ElvesKnowHighestCaloryCount()
    {
        Elves.HighestCaloryCount(123).Should().Be(123);
    }
}

public class Elves
{
    public static int HighestCaloryCount(int calories)
    {
        return calories;
    }
}