using System.Text.Json;
using System.Text.Json.Serialization;

namespace MySocailApp.Application.InfrastructureServices.IAService.Objects
{
    public class ChatGPT_ContentJsonConverter : JsonConverter<ChatGPT_Content>
    {
        public override ChatGPT_Content? Read(ref Utf8JsonReader reader, Type typeToConvert, JsonSerializerOptions options)
        {
            throw new NotImplementedException();
        }

        public override void Write(Utf8JsonWriter writer, ChatGPT_Content value, JsonSerializerOptions options)
            => JsonSerializer.Serialize(writer, value, value.GetType(), options);
    }
}
