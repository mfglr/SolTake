using MediatR;

namespace MySocailApp.Application.Queries.UserDomain.GetUserByUserName
{
    public record GetUserByUserNameDto(string UserName) : IRequest<UserResponseDto>;
}
