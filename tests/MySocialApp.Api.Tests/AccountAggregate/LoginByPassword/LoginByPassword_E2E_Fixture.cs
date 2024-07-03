using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Application.Commands.AccountAggregate;
using MySocailApp.Application.Commands.AccountAggregate.CreateAccount;
using MySocailApp.Infrastructure.DbContexts;
using Newtonsoft.Json;
using System.Net.Http.Headers;
using System.Net.Http.Json;

namespace MySocialApp.Api.Tests.AccountAggregate.UpdateEmail
{
    public class LoginByPassword_E2E_Fixture : IDisposable
    {
        private readonly Application _application;
        public readonly HttpClient Client;
        public readonly HttpClient ClientWithAccessToken;

        public readonly string Email = "test@outlook.com";
        public readonly string Password = "123456789Mfg.";

        public LoginByPassword_E2E_Fixture()
        {
            _application = new Application();
            Client = _application.CreateClient();
            ClientWithAccessToken = _application.CreateClient();
            SeedData();
        }
        public void SeedData()
        {
            var request = new CreateAccountDto(Email, Password, Password);
            var task = Client.PostAsJsonAsync("api/accounts/create", request);
            task.Wait();
            var response = task.Result;
            
            using var stream = response.Content.ReadAsStream();
            using var reader = new StreamReader(stream);
            var content = reader.ReadToEnd();
            var loginResponse = JsonConvert.DeserializeObject<AccountDto>(content)!;
            ClientWithAccessToken.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", loginResponse.Token.AccessToken);
        }

        public void DestroyDataBase()
        {
            using var scope = _application.Services.CreateScope();
            var context = scope.ServiceProvider.GetRequiredService<AppDbContext>();
            context.Database.EnsureDeleted();
        }
        public void Dispose()
        {
            DestroyDataBase();
            _application.Dispose();
            Client.Dispose();
        }
    }
}
