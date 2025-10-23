using Microsoft.Extensions.Configuration;
using OpenAI;
using OpenAI.Chat;
using System.ClientModel;

namespace SolTake.Application.InfrastructureServices.OpenAIService
{
    public class GptO1(IConfiguration configuration) :
        ChatClient(
            model: AIModels.GptO1,
            credential: new ApiKeyCredential(configuration["ChatGPT:ApiKey"]!),
            options: new OpenAIClientOptions()
            {
                Endpoint = new Uri(configuration["ChatGPT:BaseUrl"]!)
            }
        );
}
