﻿using SolTake.Application.Configurations;
using SolTake.Application.InfrastructureServices.IAService.Exceptions;
using SolTake.Application.InfrastructureServices.IAService.Objects;
using Newtonsoft.Json;
using System.Net.Http.Json;
using System.Text.Json;

namespace SolTake.Application.InfrastructureServices.IAService
{
    public class ChatGPT_Service(IChatGPTSettings chatGPTSettings)
    {
        private readonly IChatGPTSettings _chatGPTSettings = chatGPTSettings;

        public async Task<ChatGBT_Response> SendAsync(ChatGPT_Request request)
        {
            using var client = new HttpClient();
            client.DefaultRequestHeaders.Authorization = new("Bearer", _chatGPTSettings.ApiKey);
            var response = await client.PostAsJsonAsync(
                _chatGPTSettings.BaseUrl,
                request,
                options: new () {
                    PropertyNamingPolicy = JsonNamingPolicy.SnakeCaseLower,
                    Converters = { new ChatGPT_ContentJsonConverter() }
                }
            );

            var r = JsonConvert.DeserializeObject<ChatGBT_Response>(await response.Content.ReadAsStringAsync())!;

            if (!response.IsSuccessStatusCode)
                throw new ChatGPTException(r.Error!.Message);

            return r;
        } 
    }
}
