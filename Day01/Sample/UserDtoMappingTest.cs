using Xunit;
using static Sample.Gender;

namespace Sample;

public static class GenderMapper{
    public static string AsDto(this Gender gender) => gender switch
        {
            Male => "Male",
            Female => "Female",
            Other => "Other",
        };
}

public class UserDto
{
    public int Id { get; init; }
    public string Username { get; init; }
    public string Gender { get; init; }

    public static implicit operator UserDto(User u) =>
        new()
        {
            Id = u.Id,
            Username = u.UserName,
            Gender =u.Gender.AsDto()
        };


}

public class User
{
    public int Id { get; init; }
    public string UserName { get; init; }
    public Gender Gender { get; init; }
}

public enum Gender
{
    Male,
    Female,
    Other
}

public class UserDtoMappingTest
{
    [Theory]
    [InlineData(Female, "Female")] 
    [InlineData(Male, "Male")] 
    [InlineData(Other, "Other")] 
    public void MapsOutEachGender(Gender gender, string expected)
    {
        UserDto userDto = new User{Gender = gender};
        Assert.Equal(expected, userDto.Gender);
    }
}