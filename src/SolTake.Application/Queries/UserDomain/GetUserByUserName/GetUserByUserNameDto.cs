using MediatR;

namespace SolTake.Application.Queries.UserDomain.GetUserByUserName
{
    public record GetUserByUserNameDto(string UserName) : IRequest<UserResponseDto>;
}
