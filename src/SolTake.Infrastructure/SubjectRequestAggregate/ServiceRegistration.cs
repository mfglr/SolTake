using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.SubjectRequestAggregate.Abstracts;

namespace SolTake.Infrastructure.SubjectRequestAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddSubjectRequestInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<ISubjectRequestRepository,SubjectRequestRepository>();
    }
}
