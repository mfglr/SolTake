using MySocailApp.Application.Commands.AccountAggregate.UpdateUserName;
using System.Net;
using System.Net.Http.Json;

namespace MySocialApp.Api.Tests.AccountAggregate.UpdateUserName
{
    public class UpdateUserName_E2E_Tests(UpdateUserName_E2E_Fixture fixture) : IClassFixture<UpdateUserName_E2E_Fixture>
    {
        private readonly UpdateUserName_E2E_Fixture _fixture = fixture;

        [Fact]
        public async Task WhenAccessTokenDoesNotExist_ReturnException()
        {
            var userName = "test_test";
            var request = new UpdateUserNameDto(userName);
            var endPoint = "api/accounts/updateUserName";

            var response = await _fixture.Client.PutAsJsonAsync(endPoint, request);

            Assert.Equal(HttpStatusCode.Unauthorized, response.StatusCode);
        }

        [Fact]
        public async Task WhenUserNameIsEmpty_ReturnException()
        {
            var userName = "";
            var request = new UpdateUserNameDto(userName);
            var endPoint = "api/accounts/updateUserName";
            var message = "A user name is required";

            var response = await _fixture.ClientWithAccessToken.PutAsJsonAsync(endPoint, request);
            using var stream = await response.Content.ReadAsStreamAsync();
            using var reader = new StreamReader(stream);
            var content = await reader.ReadToEndAsync();

            Assert.Equal(HttpStatusCode.BadRequest,response.StatusCode);
            Assert.Equal(message,content);
        }

        [Theory]
        [InlineData("çxxx")]
        [InlineData("ğxxx")]
        [InlineData("ıxxx")]
        [InlineData("öxxx")]
        [InlineData("şxxx")]
        [InlineData("üxxx")]
        [InlineData("Axxx")]
        [InlineData("Bxxx")]
        [InlineData("Cxxx")]
        [InlineData("Çxxx")]
        [InlineData("Dxxx")]
        [InlineData("Exxx")]
        [InlineData("Fxxx")]
        [InlineData("Gxxx")]
        [InlineData("Ğxxx")]
        [InlineData("Hxxx")]
        [InlineData("Ixxx")]
        [InlineData("İxxx")]
        [InlineData("Jxxx")]
        [InlineData("Kxxx")]
        [InlineData("Lxxx")]
        [InlineData("Mxxx")]
        [InlineData("Nxxx")]
        [InlineData("Oxxx")]
        [InlineData("Öxxx")]
        [InlineData("Pxxx")]
        [InlineData("Rxxx")]
        [InlineData("Sxxx")]
        [InlineData("Şxxx")]
        [InlineData("Txxx")]
        [InlineData("Uxxx")]
        [InlineData("Üxxx")]
        [InlineData("Vxxx")]
        [InlineData("Yxxx")]
        [InlineData("Zxxx")]
        [InlineData("Wxxx")]
        [InlineData("Xxxx")]
        [InlineData("Qxxx")]
        [InlineData(":xxx")]
        [InlineData(";xxx")]
        [InlineData("-xxx")]
        [InlineData("+xxx")]
        [InlineData("*xxx")]
        [InlineData("/xxx")]
        [InlineData("\\xxx")]
        [InlineData("|xxx")]
        [InlineData("?xxx")]
        [InlineData("(xxx")]
        [InlineData(")xxx")]
        [InlineData("[xxx")]
        [InlineData("]xxx")]
        [InlineData("{xxx")]
        [InlineData("}xxx")]
        [InlineData("^xxx")]
        [InlineData("%xxx")]
        [InlineData("&xxx")]
        [InlineData("$xxx")]
        [InlineData("#xxx")]
        [InlineData("@xxx")]
        [InlineData("!xxx")]
        [InlineData("`xxx")]
        [InlineData("~xxx")]
        [InlineData("\"xxx")]
        public async Task WhenUserNameIsNotValid_ReturnException(string userName)
        {
            var request = new UpdateUserNameDto(userName);
            var endPoint = "api/accounts/updateUserName";
            var message = $"The user name is not valid!";

            var response = await _fixture.ClientWithAccessToken.PutAsJsonAsync(endPoint, request);
            using var stream = await response.Content.ReadAsStreamAsync();
            using var reader = new StreamReader(stream);
            var content = await reader.ReadToEndAsync();

            Assert.Equal(HttpStatusCode.BadRequest, response.StatusCode);
            Assert.Equal(message, content);
        }
    }
}
