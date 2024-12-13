using MediatR;

namespace MySocailApp.Application.Commands.AccountAggregate.SendPasswordResetMail
{
    public record SendPasswordResetMailDto(string Email) : IRequest;
}
