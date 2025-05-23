using MediatR;

namespace SolTake.Application.Commands.UserDomain.UserAggregate.UpdateLanguage
{
    public record UpdateLanguageDto(string Language) : IRequest;
}
