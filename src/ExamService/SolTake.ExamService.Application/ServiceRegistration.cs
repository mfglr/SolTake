using MassTransit;
using Microsoft.Extensions.DependencyInjection;
using SolTake.ExamService.Application.ApplicationServices.Create;
using SolTake.ExamService.Application.ApplicationServices.Exist;
using SolTake.ExamService.Application.ApplicationServices.GetById;
using SolTake.ExamService.Domain;

namespace SolTake.ExamService.Application
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddApplicationServices(this IServiceCollection services) =>
            services
                .AddScoped<ExamCreatorDomainService>()
                .AddMediator(cfg =>
                {
                    cfg.AddConsumer<CreateHandler>();
                    cfg.AddConsumer<GetByIdHandler>();
                    cfg.AddConsumer<ExistHandler>();
                });
    }
}
