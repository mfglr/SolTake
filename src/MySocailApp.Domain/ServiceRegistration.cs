using AccountDomain;
using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.AppVersionAggregate;
using MySocailApp.Domain.CommentAggregate;
using MySocailApp.Domain.MessageDomain.MessageAggregate;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate;
using MySocailApp.Domain.SolutionAggregate;

namespace MySocailApp.Domain
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddDomain(this IServiceCollection services)
            => services
                .AddAccountDomain()
                .AddAppVersionDomainServices()
                .AddCommentDomainServices()
                .AddMessageDomainServices()
                .AddQuestionDomainServices()
                .AddSolutionDomainServices();
    }
}
