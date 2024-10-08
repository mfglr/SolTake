using MediatR;

namespace MySocailApp.Application.Queries.TermsOfUseAggregate.GetLastTermsOfUse
{
    public record GetLastTermsOfUseDto(string Language) : IRequest<Stream>;
}
