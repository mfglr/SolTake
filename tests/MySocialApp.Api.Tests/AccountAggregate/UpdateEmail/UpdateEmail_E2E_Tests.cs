using MySocailApp.Application.Commands.AccountAggregate.UpdateEmail;
using MySocailApp.Application.Queries.AccountAggregate;
using Newtonsoft.Json;
using System.Net;
using System.Net.Http.Json;

namespace MySocialApp.Api.Tests.AccountAggregate.UpdateEmail
{
    public class UpdateEmail_E2E_Tests(LoginByPassword_E2E_Fixture fixture) : IClassFixture<LoginByPassword_E2E_Fixture>
    {
        private readonly LoginByPassword_E2E_Fixture _fixture = fixture;

        [Fact]
        public async Task WhenClientHasNotAccessToken_ReturnException()
        {
            var request = new UpdateEmailDto("fafdasfds");
            var endPoint = "api/accounts/UpdateEmail";

            var response = await _fixture.Client.PutAsJsonAsync(endPoint, request);
            using var stream = await response.Content.ReadAsStreamAsync();
            using var reader = new StreamReader(stream);
            var content = await reader.ReadToEndAsync();

            Assert.Equal(HttpStatusCode.Unauthorized, response.StatusCode);
        }

        [Fact]
        public async Task WhenEmailIsEmpty_ReturnException()
        {
            var email = "";
            var request = new UpdateEmailDto(email);
            var endPoint = "api/accounts/UpdateEmail";
            var message = "An email is required!";

            var response = await _fixture.ClientWithAccessToken.PutAsJsonAsync(endPoint,request);
            using var stream = await response.Content.ReadAsStreamAsync();
            using var reader = new StreamReader(stream);
            var content = await reader.ReadToEndAsync();

            Assert.Equal(message, content);
            Assert.Equal(HttpStatusCode.BadRequest, response.StatusCode);
        }

        [Theory]
        [InlineData("test")]
        [InlineData("test@")]
        [InlineData("test@test")]
        [InlineData("test@test.")]
        public async Task WhenEmailIsInvalid_ReturnExceptiom(string email)
        {
            var request = new UpdateEmailDto(email);
            var endPoint = "api/accounts/UpdateEmail";
            var message = "The email is invalid!";

            var response = await _fixture.ClientWithAccessToken.PutAsJsonAsync(endPoint, request);
            using var stream = await response.Content.ReadAsStreamAsync();
            using var reader = new StreamReader(stream);
            var content = await reader.ReadToEndAsync();

            Assert.Equal(message, content);
            Assert.Equal(HttpStatusCode.BadRequest, response.StatusCode);
        }

        [Fact]
        public async Task WhenEmailIsValid_ReturnSuccess()
        {
            var email = "test1@outlook.com";
            var request = new UpdateEmailDto(email);
            var endPoint = "api/accounts/UpdateEmail";

            var response = await _fixture.ClientWithAccessToken.PutAsJsonAsync(endPoint, request);

            var endPoint1 = $"api/accounts/GetByEmail/{email}";

            var response1 = await _fixture.ClientWithAccessToken.GetAsync(endPoint1);
            using var stream1 = await response1.Content.ReadAsStreamAsync();
            using var reader1 = new StreamReader(stream1);
            var content1 = await reader1.ReadToEndAsync();
            var accountRespone = JsonConvert.DeserializeObject<AccountResponseDto>(content1);

            Assert.Equal(HttpStatusCode.OK, response.StatusCode);
            Assert.NotNull(accountRespone);
            Assert.Equal(email, accountRespone.Email);
            Assert.Equal(HttpStatusCode.OK, response.StatusCode);
        }

    }
}
