using MediatR;

namespace MySocailApp.Application.Commands.UserAggregate.UpdateLanguage
{
    public record UpdateLanguageDto(string Language) : IRequest;
}
