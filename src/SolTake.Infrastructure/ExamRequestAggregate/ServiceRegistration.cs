using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.ExamRequestAggregate.Abstracts;

namespace SolTake.Infrastructure.ExamRequestAggregate
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddExamRequestInfrastructureServices(this IServiceCollection services)
            => services
                .AddScoped<IExamRequestRepository, ExamRequestRepository>();
    }
}
