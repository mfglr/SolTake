using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetUser
{
    public record GetUserDto : IRequest<AppUserResponseDto>;
}
