using MediatR;
using MySocailApp.Application.Queries.UserDomain.UserAggregate;

namespace MySocailApp.Application.Queries.UserDomain.UserAggregate.GetUserById
{
    public record GetUserByIdDto(int Id) : IRequest<UserResponseDto>;
}
