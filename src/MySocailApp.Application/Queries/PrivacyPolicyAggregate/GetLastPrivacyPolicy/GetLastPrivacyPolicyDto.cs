using MediatR;

namespace MySocailApp.Application.Queries.PrivacyPolicyAggregate.GetLastPrivacyPolicy
{
    public record GetLastPrivacyPolicyDto(string Language) : IRequest<Stream>;
}
