using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetRequesters
{
    public record GetRequesterDto(int? LastId) : IRequest<List<AppUserResponseDto>>;
}
