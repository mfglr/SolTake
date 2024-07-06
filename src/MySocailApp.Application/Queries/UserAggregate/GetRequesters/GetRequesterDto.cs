using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetRequesters
{
    public record GetRequesterDto(string? LastId) : IRequest<List<AppUserResponseDto>>;
}
