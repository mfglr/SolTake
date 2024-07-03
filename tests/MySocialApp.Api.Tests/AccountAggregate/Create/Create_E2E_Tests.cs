using MySocailApp.Application.Commands.AccountAggregate.CreateAccount;
using MySocailApp.Application.Queries.UserAggregate;
using MySocailApp.Domain.AppUserAggregate;
using Newtonsoft.Json;
using System.Net;
using System.Net.Http.Json;

namespace MySocialApp.Api.Tests.AccountAggregate.Create
{
    public class Create_E2E_Tests(Create_E2E_Fixture fixture) : IClassFixture<Create_E2E_Fixture>
    {
        private readonly Create_E2E_Fixture _fixture = fixture;

        [Fact]
        public async Task WhenPasswordIsEmpty_ReturnException()
        {
            string email = "test1@outlook.com";
            string password = "";
            var message = "A password is required";
            var statusCode = HttpStatusCode.BadRequest;
            var request = new CreateAccountDto(email, password, password);
            var endPoint = "api/Accounts/Create";

            var response = await _fixture.Client.PostAsJsonAsync(endPoint, request);
            using var stream = await response.Content.ReadAsStreamAsync();
            using var reader = new StreamReader(stream);
            var content = await reader.ReadToEndAsync();

            Assert.Equal(message, content);
            Assert.Equal(statusCode, response.StatusCode);
        }

        [Fact]
        public async Task WhenPasswordAndPaswordConfirmationDoesNotMacth_ReturnException()
        {
            var message = "The password and the password confirmation does not macth!";
            var statusCode = HttpStatusCode.BadRequest;
            var request = new CreateAccountDto("test@test.com", "123456", "1234567");
            var endPoint = "api/Accounts/Create";

            var response = await _fixture.Client.PostAsJsonAsync(endPoint, request);
            using var stream = await response.Content.ReadAsStreamAsync();
            using var reader = new StreamReader(stream);
            var content = await reader.ReadToEndAsync();

            Assert.Equal(message, content);
            Assert.Equal(statusCode, response.StatusCode);
        }

        [Fact]
        public async Task WhenEmailIsEmpty_ReturnException()
        {
            string password = "123456";
            string email = "";
            var message = "An email is required";
            var statusCode = HttpStatusCode.BadRequest;
            var request = new CreateAccountDto(email, password, password);
            var endPoint = "api/Accounts/Create";

            var response = await _fixture.Client.PostAsJsonAsync(endPoint, request);
            using var stream = await response.Content.ReadAsStreamAsync();
            using var reader = new StreamReader(stream);
            var content = await reader.ReadToEndAsync();

            Assert.Equal(message, content);
            Assert.Equal(statusCode, response.StatusCode);
        }

        [Theory]
        [InlineData("test")]
        [InlineData("test@")]
        [InlineData("test@test")]
        [InlineData("test@test.")]
        public async Task WhenEmailIsNotValid_ReturnException(string email)
        {
            var message = $"The email is invalid!";
            var statusCode = HttpStatusCode.BadRequest;
            var request = new CreateAccountDto(email, "123456", "123456");
            var endPoint = "api/Accounts/Create";

            var response = await _fixture.Client.PostAsJsonAsync(endPoint, request);
            using var stream = await response.Content.ReadAsStreamAsync();
            using var reader = new StreamReader(stream);
            var content = await reader.ReadToEndAsync();

            Assert.Equal(message, content);
            Assert.Equal(statusCode, response.StatusCode);
        }

        [Fact]
        public async Task WhenEmailIsAlreadyRegistered_ReturnException()
        {
            var message = "The email is alredy registered!";
            var statusCode = HttpStatusCode.BadRequest;
            var request = new CreateAccountDto(_fixture.Email, "123456", "123456");
            var endPoint = "api/Accounts/Create";

            var response = await _fixture.Client.PostAsJsonAsync(endPoint, request);
            using var stream = await response.Content.ReadAsStreamAsync();
            using var reader = new StreamReader(stream);
            var content = await reader.ReadToEndAsync();

            Assert.Equal(message, content);
            Assert.Equal(statusCode, response.StatusCode);
        }

    }
}
