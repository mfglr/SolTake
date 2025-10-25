using MassTransit;
using Microsoft.Extensions.DependencyInjection;
using SolTake.SubjectService.Application.ApplicationServices.Create;
using SolTake.SubjectService.Application.ApplicationServices.Exist;

namespace SolTake.SubjectService.Application
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddApplicationServices(this IServiceCollection services) =>
            services
                .AddMediator(x =>
                {
                    x.AddConsumer<CreateHandler>();
                    x.AddConsumer<ExistHandler>();
                });
    }
}
