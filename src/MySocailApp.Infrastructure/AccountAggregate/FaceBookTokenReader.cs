using MySocailApp.Application.Configurations;
using MySocailApp.Domain.AccountAggregate.DomainServices;
using MySocailApp.Domain.AccountAggregate.Exceptions;
using Newtonsoft.Json.Linq;

namespace MySocailApp.Infrastructure.AccountAggregate
{
    public class FaceBookTokenReader(IFaceBookSettings settings) : IFaceBookTokenReader
    {
        private readonly IFaceBookSettings _settings = settings;

        public async Task<string> ReadUserId(string accessToken, CancellationToken cancellationToken)
        {
            using var client = new HttpClient();
            var appAccessToken = $"{_settings.AppId}|{_settings.AppSecret}";
            var verificationUrl = $"https://graph.facebook.com/debug_token?input_token={accessToken}&access_token={appAccessToken}";
            
            var response = await client.GetStringAsync(verificationUrl,cancellationToken);
            var jsonResponse = JObject.Parse(response);
            if(!jsonResponse["data"]!["is_valid"]!.ToObject<bool>())
                throw new FaceBookTokenNotValidException();
            return jsonResponse["data"]!["user_id"]!.ToObject<string>()!;
        }
    }
}
