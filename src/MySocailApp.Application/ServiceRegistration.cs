using MediatR;
using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Application.InfrastructureServices.IAService;
using MySocailApp.Application.PipelineBehaviours;
using System.Reflection;

namespace MySocailApp.Application
{
    public static class ServiceRegistration
    {
        public static IServiceCollection AddApplicationServices(this IServiceCollection services)
        {
            var assembly = Assembly.GetExecutingAssembly();

            return services
                .AddAutoMapper(assembly)
                .AddMediatR(x => x.RegisterServicesFromAssembly(assembly))
                .AddTransient(typeof(IPipelineBehavior<,>), typeof(AppPipelineBehaviour<,>))
                .AddScoped<ChatGPT_Service>();
        }
    }
}
