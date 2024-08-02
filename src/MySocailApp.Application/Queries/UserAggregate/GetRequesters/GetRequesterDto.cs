using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetRequesters
{
    public record GetRequesterDto(int? LastValue) : IRequest<List<AppUserResponseDto>>;
}
