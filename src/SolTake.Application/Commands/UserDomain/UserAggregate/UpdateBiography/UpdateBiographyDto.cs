using MediatR;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.UpdateBiography
{
    public record UpdateBiographyDto(string Biography) : IRequest;
}
