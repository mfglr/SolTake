using OpenAI.Chat;

namespace SolTake.Application.InfrastructureServices.OpenAIService
{
    public class ChatClientProvider
    {
        private readonly Gpt4Dot1 _gpt4Dot1;
        private readonly Gpt4Dot1Mini _gpt4Dot1Mini;
        
        private readonly Gpt4O _gpt4O;
        private readonly Gpt4OMini _gpt4OMini;

        private readonly GptO4Mini _gptOMini;

        private readonly GptO1 _gptO1;

        private readonly Dictionary<string, ChatClient> _chatClients;

        public ChatClientProvider(Gpt4Dot1Mini gpt4Dot1Mini, Gpt4OMini gpt4OMini, Gpt4Dot1 gpt4Dot1, Gpt4O gpt4O, GptO4Mini gptOMini, GptO1 gptO1)
        {
            _gpt4Dot1 = gpt4Dot1;
            _gpt4Dot1Mini = gpt4Dot1Mini;

            _gpt4O = gpt4O;
            _gpt4OMini = gpt4OMini;

            _gptOMini = gptOMini;

            _gptO1 = gptO1;

            _chatClients = new Dictionary<string, ChatClient>()
            {
                { AIModels.Gpt4Dot1, _gpt4Dot1 },
                { AIModels.Gpt4Dot1Mini, _gpt4Dot1Mini },

                { AIModels.Gpt4O, _gpt4O },
                { AIModels.Gpt4OMini, _gpt4OMini },

                { AIModels.GptO4Mini, _gptOMini },

                { AIModels.GptO1, _gptO1 },
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
