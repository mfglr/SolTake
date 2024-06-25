using MediatR;

namespace MySocailApp.Application.Commands.AccountAggregate.SendEmailConfirmationMail
{
    public record SendEmailConfirmationMailDto() : IRequest;
}
