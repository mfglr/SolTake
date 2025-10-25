using Microsoft.Extensions.DependencyInjection;
using SolTake.SubjectService.Domain;

namespace SolTake.SubjectService.Infrastructure
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddInfrastructureServices(this IServiceCollection services) =>
            services
                .AddScoped<MongoContext>()
                .AddScoped<ISubjectRepository, SubjectRepository>()
                .AddScoped<SubjectCreator>();
    }
}
