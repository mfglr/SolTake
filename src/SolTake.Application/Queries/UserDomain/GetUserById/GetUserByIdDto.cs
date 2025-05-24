using MediatR;

namespace SolTake.Application.Queries.UserDomain.GetUserById
{
    public record GetUserByIdDto(int Id) : IRequest<UserResponseDto>;
}
