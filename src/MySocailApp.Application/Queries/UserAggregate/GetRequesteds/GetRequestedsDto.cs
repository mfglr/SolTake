using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetRequesteds
{
    public record GetRequestedsDto(int? LastValue) : IRequest<List<AppUserResponseDto>>;
}
