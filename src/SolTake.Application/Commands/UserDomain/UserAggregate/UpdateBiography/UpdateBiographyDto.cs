using MediatR;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdateBiography
{
    public record UpdateBiographyDto(string Biography) : IRequest;
}
