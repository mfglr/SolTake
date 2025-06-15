using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.SubjectTopicAggregate.Abstracts;

namespace SolTake.Infrastructure.SubjectTopicAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddSubjectTopicInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<ISubjectTopicWriteRepository, SubjectTopicWriteRepository>()
                .AddScoped<ISubjectTopicReadRepository, SubjectTopicReadRepository>();
    }

}
