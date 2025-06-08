using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.SubjectAggregate.Abstracts;

namespace SolTake.Infrastructure.SubjectAggregate
{
    internal static class ServiceRegistration
    {
        public static IServiceCollection AddSubjectInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<ISubjectReadRepository, SubjectReadRepository>()
                .AddScoped<ISubjectWriteRepository, SubjectWriteRepository>();
    }
}
