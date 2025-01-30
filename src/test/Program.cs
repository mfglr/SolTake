using MySocailApp.Application.InfrastructureServices.IAService;
using MySocailApp.Application.InfrastructureServices.IAService.Objects;

var content = new ChatGPT_TextContent("Atatürk ne zaman doğdu?");
var message = new ChatGPT_Message(ChatGPT_Roles.User, [content]);
var request = new ChatGPT_Request(ChatGPT_Models.GPT_4O_Mini,[message]);

Console.WriteLine("");

