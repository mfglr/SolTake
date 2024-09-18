using MySocailApp.Domain.AccountAggregate.DomainServices;
using MySocailApp.Domain.AccountAggregate.Exceptions;
using MySocailApp.Domain.AccountAggregate.ValueObjects;
using Newtonsoft.Json.Linq;

namespace MySocailApp.Infrastructure.AccountAggregate
{
    public class GoogleTokenReader : IGoogleTokenReader
    {
        public async Task<GoogleUser> ReadToken(string accessToken, CancellationToken cancellationToken)
        {
            using var client = new HttpClient();
            var url = $"https://oauth2.googleapis.com/tokeninfo?access_token={accessToken}";
            HttpResponseMessage response = await client.GetAsync(url);

            if (!response.IsSuccessStatusCode)
                throw new GoogkeTokenNotValidException();

            string responseBody = await response.Content.ReadAsStringAsync();
            var json = JObject.Parse(responseBody);
            return new(json["sub"]!.ToObject<string>()!, json["email"]?.ToObject<string>());
        }
    }
}
