using Microsoft.Extensions.DependencyInjection;

namespace SolTake.Application.InfrastructureServices.OpenAIService
{
    internal static class ServiceRegistration
    {
        public static IServiceCollection AddOpenAIServices(this IServiceCollection services)
            =>
                services
                    .AddSingleton<Gpt4Dot1>()
                    .AddSingleton<Gpt4Dot1Mini>()
                    .AddSingleton<Gpt4O>()
                    .AddSingleton<Gpt4OMini>()
                    .AddSingleton<GptO4Mini>()
                    .AddSingleton<GptO1>()
                    .AddSingleton<ChatClientProvider>();
    }
}
