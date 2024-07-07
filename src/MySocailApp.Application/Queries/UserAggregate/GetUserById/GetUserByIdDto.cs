using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetUserById
{
    public record GetUserByIdDto(int Id) : IRequest<AppUserResponseDto>;
}
