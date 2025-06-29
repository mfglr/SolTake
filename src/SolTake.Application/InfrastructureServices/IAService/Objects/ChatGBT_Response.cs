﻿namespace SolTake.Application.InfrastructureServices.IAService.Objects
{
    public class ChatGBT_Response(IEnumerable<ChatGPT_Choice> choices, ChatGPT_Usage usage, ChatGPT_Error? error)
    {
        public IEnumerable<ChatGPT_Choice> Choices { get; private set; } = choices;
        public ChatGPT_Usage Usage { get; private set; } = usage;
        public ChatGPT_Error? Error { get; private set; } = error;
    }
}
