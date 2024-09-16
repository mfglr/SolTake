using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateBiography
{
    public record UpdateBiographyDto(string Biography) : IRequest;
}
