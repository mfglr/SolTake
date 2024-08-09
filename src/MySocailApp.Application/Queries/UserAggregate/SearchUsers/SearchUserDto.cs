using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.SearchUsers
{
    public record SearchUserDto(string Key,int? LastValue, int? Take) : IRequest<List<AppUserResponseDto>>;
}
