using Microsoft.Extensions.DependencyInjection;
using MySocailApp.Application.Commands.AccountAggregate;
using MySocailApp.Application.Commands.AccountAggregate.CreateAccount;
using MySocailApp.Infrastructure.DbContexts;
using Newtonsoft.Json;
using System.Net.Http.Headers;
using System.Net.Http.Json;

namespace MySocialApp.Api.Tests.AccountAggregate.UpdateUserName
{
    public class UpdateUserName_E2E_Fixture : IDisposable
    {
        private readonly Application _application;
        public readonly HttpClient Client;
        public readonly HttpClient ClientWithAccessToken;
        public readonly HttpClient ClientWithNoAccount;
        
        public readonly string Email = "test@outlook.com";
        public readonly string Email1 = "test@hotmail.com";
        public readonly string Password = "123456789Mfg.";

        public UpdateUserName_E2E_Fixture()
        {
            _application = new Application();
            Client = _application.CreateClient();
            ClientWithAccessToken = _application.CreateClient();
            ClientWithNoAccount = _application.CreateClient();
            SeedData();
        }
        private void SeedData()
        {
            var request = new CreateAccountDto(Email, Password,Password);
            var task = Client.PostAsJsonAsync("api/accounts/create", request);
            task.Wait();
            var response = task.Result;
            using var stream = response.Content.ReadAsStream();
            using var reader = new StreamReader(stream);
            var content = reader.ReadToEnd();
            var loginResponse = JsonConvert.DeserializeObject<LoginResponseDto>(content)!;

            ClientWithAccessToken.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer",loginResponse.Token.AccessToken);
        }

        private void CreateAnAccount_GetAccessToken_DeleteTheAccount()
        {
            var request = new CreateAccountDto(Email1, Password, Password);
            var task = Client.PostAsJsonAsync("api/accounts/create", request);
            task.Wait();
            var response = task.Result;
            using var stream = response.Content.ReadAsStream();
            using var reader = new StreamReader(stream);
            var content = reader.ReadToEnd();
            var loginResponse = JsonConvert.DeserializeObject<LoginResponseDto>(content)!;

            ClientWithNoAccount.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue("Bearer", loginResponse.Token.AccessToken);


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
