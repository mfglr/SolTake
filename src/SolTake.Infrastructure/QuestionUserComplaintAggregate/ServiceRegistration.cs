using Microsoft.Extensions.DependencyInjection;
using SolTake.Domain.QuestionUserComplaintAggregate.Abstracts;

namespace SolTake.Infrastructure.QuestionUserComplaintAggregate
{
    internal static class ServiceRegistration
    {
        public static IServiceCollection AddQuestionUserComplaintAggregateInfrastrucureServices(this IServiceCollection services) =>
            services
                .AddScoped<IQuestionUserComplaintRepository, QuestionUserComplaintRepository>();
    }
}
