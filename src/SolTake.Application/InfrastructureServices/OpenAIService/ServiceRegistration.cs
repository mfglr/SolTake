using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using OpenAI;
using OpenAI.Chat;
using System.ClientModel;

namespace SolTake.Application.InfrastructureServices.OpenAIService
{
    internal static class ServiceRegistration
    {
        public static IServiceCollection AddOpenAIServices(this IServiceCollection services, IConfiguration configuration)
            =>
                services
                    .AddSingleton<Gpt4Dot1Mini>()
                    .AddSingleton<Gpt4OMini>()
                    .AddSingleton<ChatClientProvider>();
    }
}
