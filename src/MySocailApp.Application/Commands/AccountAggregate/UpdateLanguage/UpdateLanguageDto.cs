using MediatR;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdateLanguage
{
    public record UpdateLanguageDto(string Language) : IRequest;
}
