using AccountDomain.AccountAggregate.Configurations;
using AccountDomain.AccountAggregate.Exceptions;
using Newtonsoft.Json.Linq;

namespace AccountDomain.AccountAggregate.DomainServices
{
    public class FaceBookTokenValidatorDomainService(IFaceBookSettings settings)
    {
        private readonly IFaceBookSettings _settings = settings;

        public async Task<string> ValidateAsync(string accessToken, CancellationToken cancellationToken)
        {
            using var client = new HttpClient();
            var appAccessToken = $"{_settings.AppId}|{_settings.AppSecret}";
            var verificationUrl = $"https://graph.facebook.com/debug_token?input_token={accessToken}&access_token={appAccessToken}";

            var response = await client.GetStringAsync(verificationUrl, cancellationToken);
            var jsonResponse = JObject.Parse(response);
            if (!jsonResponse["data"]!["is_valid"]!.ToObject<bool>())
                throw new FaceBookTokenNotValidException();
            return jsonResponse["data"]!["user_id"]!.ToObject<string>()!;
        }
    }
}
