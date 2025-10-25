using Microsoft.Extensions.DependencyInjection;
using SolTake.ExamService.Domain;

namespace SolTake.ExamService.Infrastructure
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddInfrastructureServices(this IServiceCollection services) =>
            services
                .AddScoped<MongoContext>()
                .AddScoped<IExamRepository, ExamRepository>();
    }
}
