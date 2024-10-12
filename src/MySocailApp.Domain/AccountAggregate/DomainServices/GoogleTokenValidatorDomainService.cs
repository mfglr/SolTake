using MySocailApp.Domain.AccountAggregate.Exceptions;
using MySocailApp.Domain.AccountAggregate.ValueObjects;
using Newtonsoft.Json.Linq;

namespace MySocailApp.Domain.AccountAggregate.DomainServices
{
    public class GoogleTokenValidatorDomainService
    {
        public async Task<GoogleUser> ValidateAsync(string accessToken, CancellationToken cancellationToken)
        {
            using var client = new HttpClient();
            var url = $"https://oauth2.googleapis.com/tokeninfo?access_token={accessToken}";
            HttpResponseMessage response = await client.GetAsync(url, cancellationToken);

            if (!response.IsSuccessStatusCode)
                throw new GoogleTokenNotValidException();

            string responseBody = await response.Content.ReadAsStringAsync(cancellationToken);
            var json = JObject.Parse(responseBody);
            return new(json["sub"]!.ToObject<string>()!, json["email"]?.ToObject<string>());
        }
    }
}
