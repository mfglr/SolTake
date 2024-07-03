using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetUserById
{
    public record GetUserByIdDto(string Id) : IRequest<AppUserResponseDto>;
}
