using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetUserByUserName
{
    public record GetUserByUserNameDto(string UserName) : IRequest<UserResponseDto>;
}
