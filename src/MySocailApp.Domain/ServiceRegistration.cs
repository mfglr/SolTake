using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Domain.AccountDomain.AccountAggregate;
using MySocailApp.Domain.AppVersionAggregate;
using MySocailApp.Domain.CommentAggregate;
using MySocailApp.Domain.MessageAggregate;
using MySocailApp.Domain.QuestionAggregate;
using MySocailApp.Domain.SolutionAggregate;

namespace MySocailApp.Domain
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddDomainServices(this IServiceCollection services)
            => services
                .AddAppVersionDomainServices()
                .AddAccountDomainServices()
                .AddCommentDomainServices()
                .AddMessageDomainServices()
                .AddQuestionDomainServices()
                .AddSolutionDomainServices();
    }
}
