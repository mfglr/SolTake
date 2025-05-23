namespace SolTake.Application.InfrastructureServices.IAService.Objects
{
    public class ChatGPT_Request(string model, IEnumerable<ChatGPT_Message> messages)
    {
        public string Model { get; private set; } = model;
        public IEnumerable<ChatGPT_Message> Messages { get; private set; } = messages;
    }
}
