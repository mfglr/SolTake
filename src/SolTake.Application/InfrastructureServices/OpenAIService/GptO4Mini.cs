using Microsoft.Extensions.Configuration;
using OpenAI;
using OpenAI.Chat;
using System.ClientModel;

namespace SolTake.Application.InfrastructureServices.OpenAIService
{
    public class GptO4Mini(IConfiguration configuration) :
        ChatClient(
            model: AIModels.GptO4Mini,
            credential: new ApiKeyCredential(configuration["ChatGPT:ApiKey"]!),
            options: new OpenAIClientOptions()
            {
                Endpoint = new Uri(configuration["ChatGPT:BaseUrl"]!)
            }
        );
}
