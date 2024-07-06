using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetRequesteds
{
    public record GetRequestedsDto(string? LastId) : IRequest<List<AppUserResponseDto>>;
}
