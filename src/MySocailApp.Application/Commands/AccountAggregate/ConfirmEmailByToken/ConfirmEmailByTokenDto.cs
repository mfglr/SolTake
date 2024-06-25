using MediatR;

namespace MySocailApp.Application.Commands.AccountAggregate.ConfirmEmailByToken
{
    public record ConfirmEmailByTokenDto(string Token) : IRequest; 
}
