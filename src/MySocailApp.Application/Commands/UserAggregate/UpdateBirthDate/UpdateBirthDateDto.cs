using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateBirthDate
{
    public record UpdateBirthDateDto(DateTime BirthDate) : IRequest;
}
