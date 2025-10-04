using OpenAI.Chat;

namespace SolTake.Application.InfrastructureServices.OpenAIService
{
    public class ChatClientProvider
    {
        private readonly Gpt4Dot1Mini _gpt4Dot1Mini;
        private readonly Gpt4OMini _gpt4OMini;

        private readonly Dictionary<string, ChatClient> _chatClients;

        public ChatClientProvider(Gpt4Dot1Mini gpt4Dot1Mini, Gpt4OMini gpt4OMini)
        {
            _gpt4Dot1Mini = gpt4Dot1Mini;
            _gpt4OMini = gpt4OMini;
            _chatClients = new Dictionary<string, ChatClient>()
            {
                { AIModels.Gpt_4_1_Mini, _gpt4Dot1Mini },
                { AIModels.Gpt_4o_Mini, _gpt4OMini },
            };
        }

        public ChatClient Get(string model)
        {
            try
            {
                return _chatClients[model];
            }
            catch (KeyNotFoundException)
            {
                throw new ModelNotFoundException();
            }
        }
    }
}
