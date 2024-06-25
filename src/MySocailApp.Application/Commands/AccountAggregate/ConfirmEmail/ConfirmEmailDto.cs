using MediatR;

namespace MySocailApp.Application.Commands.AccountAggregate.ConfirmEmail
{
    public record ConfirmEmailDto(string Id,string Token) : IRequest;
}
