using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using SolTake.QuestionService.Application;
using SolTake.QuestionService.Domain.Abstracts;

namespace SolTake.QuestionService.Infrastructure
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddInfrastructureServices(this IServiceCollection services) => services
                .AddSingleton<IBlobService,LocalBlobService>()
                .AddScoped<MongoContext>()
                .AddScoped<IQuestionRepository, QuestionRepository>();

    }
}
