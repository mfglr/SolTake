using MediatR;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdateLanguage
{
    public record UpdateLanguageDto(string Language) : IRequest;
}
