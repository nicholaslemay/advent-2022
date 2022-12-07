using FluentAssertions;
using Xunit;

namespace Day01Part1;

public class Part1Test
{
    [Fact]
    public void Test1()
    {
        Elves.HighestCaloryCount().Should().Be(1);
    }
}

public class Elves
{
    public static int HighestCaloryCount()
    {
        return 1;
    }
}