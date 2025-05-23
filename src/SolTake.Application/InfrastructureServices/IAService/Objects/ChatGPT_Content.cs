namespace SolTake.Application.InfrastructureServices.IAService.Objects
{
    public abstract class ChatGPT_Content(string type)
    {
        public string Type { get; protected set; } = type;
    }
}
