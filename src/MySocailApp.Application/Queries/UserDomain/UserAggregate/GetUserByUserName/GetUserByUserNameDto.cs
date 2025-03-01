using MediatR;
using MySocailApp.Application.Queries.UserDomain.UserAggregate;

namespace MySocailApp.Application.Queries.UserDomain.UserAggregate.GetUserByUserName
{
    public record GetUserByUserNameDto(string UserName) : IRequest<UserResponseDto>;
}
