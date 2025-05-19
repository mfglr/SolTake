using MediatR;

namespace MySocailApp.Application.Queries.UserDomain.GetUserById
{
    public record GetUserByIdDto(int Id) : IRequest<UserResponseDto>;
}
