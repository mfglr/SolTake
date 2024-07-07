using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetRequesteds
{
    public record GetRequestedsDto(int? LastId) : IRequest<List<AppUserResponseDto>>;
}
