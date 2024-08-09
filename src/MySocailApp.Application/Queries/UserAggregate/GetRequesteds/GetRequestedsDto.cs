using MediatR;

namespace MySocailApp.Application.Queries.UserAggregate.GetRequesteds
{
    public record GetRequestedsDto(int? LastValue, int? Take) : IRequest<List<AppUserResponseDto>>;
}
