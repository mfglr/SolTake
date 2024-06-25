using MySocailApp.Application.Commands.AccountAggregate.CreateAccount;
using MySocailApp.Application.Queries.AccountAggregate;
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

        [Fact]
        public async Task WhenAccountCreateSuccessfully_ShouldBeTrue()
        {
            string email = "test1@outlook.com";
            string firstSectionOfEmail = "test1";
            string password = "123456";
            var request = new CreateAccountDto(email, password, password);
            var createAccount = "api/Accounts/Create";
            var getAccount = $"api/accounts/GetByEmail/{email}";

            var createAccountResponse = await _fixture.Client.PostAsJsonAsync(createAccount, request);
            var getAccountResponse = await _fixture.ClientWithAccessToken.GetAsync(getAccount);
            using var s0 = await getAccountResponse.Content.ReadAsStreamAsync();
            using var r0 = new StreamReader(s0);
            var content0 = await r0.ReadToEndAsync();
            var accountResponse = JsonConvert.DeserializeObject<AccountResponseDto>(content0);

            var getUser = $"api/users/GetById/{accountResponse?.Id}";
            var getUserResponse = await _fixture.ClientWithAccessToken.GetAsync(getUser);
            using var s1 = await getUserResponse.Content.ReadAsStreamAsync();
            using var r1 = new StreamReader(s1);
            var content1 = await r1.ReadToEndAsync();
            var userResponse = JsonConvert.DeserializeObject<UserResponseDto>(content1);


            Assert.Equal(HttpStatusCode.OK, createAccountResponse.StatusCode);
            Assert.Equal(HttpStatusCode.OK, getAccountResponse.StatusCode);
            Assert.Equal(HttpStatusCode.OK, getUserResponse.StatusCode);

            Assert.NotNull(accountResponse);
            Assert.NotNull(userResponse);

            Assert.Equal(accountResponse.UserName, userResponse.UserName);
            Assert.Equal(accountResponse.Id, userResponse.Id);

            Assert.NotEqual(default, accountResponse.CreatedAt);
            Assert.Null(accountResponse.UpdatedAt);
            Assert.Equal(email, accountResponse.Email);
            Assert.StartsWith(firstSectionOfEmail, accountResponse.UserName);

            Assert.NotEqual(default, userResponse.CreatedAt);
            Assert.Null(userResponse.UpdatedAt);
            Assert.Equal(Gender.Default,userResponse.Gender);
            Assert.Null(userResponse.BirthDate);
            Assert.Null(userResponse.Name);
            Assert.Equal(ProfileVisibility.Public,userResponse.ProfileVisibility);
        }
    }
}
