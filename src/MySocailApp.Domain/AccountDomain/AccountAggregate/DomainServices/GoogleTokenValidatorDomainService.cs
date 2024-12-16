using MySocailApp.Domain.AccountDomain.AccountAggregate.Exceptions;
using MySocailApp.Domain.AccountDomain.AccountAggregate.ValueObjects;
using Newtonsoft.Json.Linq;

namespace MySocailApp.Domain.AccountDomain.AccountAggregate.DomainServices
{
    public class GoogleTokenValidatorDomainService
    {
        public async Task<GoogleAccount> ValidateAsync(string accessToken, CancellationToken cancellationToken)
        {
            using var client = new HttpClient();
            var url = $"https://oauth2.googleapis.com/tokeninfo?access_token={accessToken}";
            HttpResponseMessage response = await client.GetAsync(url, cancellationToken);

            if (!response.IsSuccessStatusCode)
                throw new GoogleTokenNotValidException();

            string responseBody = await response.Content.ReadAsStringAsync(cancellationToken);
            var json = JObject.Parse(responseBody);
            var email = json["email"]?.ToObject<string>();
            return new(json["sub"]!.ToObject<string>()!, email);
        }
    }
}
