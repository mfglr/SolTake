using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateGender
{
    public record UpdateGenderDto(int Gender) : IRequest;
}
