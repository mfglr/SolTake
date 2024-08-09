using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetRequesters
{
    public record GetRequesterDto(int? LastValue, int? Take) : IRequest<List<AppUserResponseDto>>;
}
