using MySocailApp.Domain.UserDomain.UserAggregate.Entities;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdateName
{
    public class UpdateNameResponseDto
    {
        public string AccessToken { get; private set; }
        public string RefreshToken { get; private set; }

        public UpdateNameResponseDto(User User)
        {
            AccessToken = User.AccessToken;
            RefreshToken = User.RefreshToken;
        }

        public UpdateNameResponseDto(string accessToken, string refreshToken)
        {
            AccessToken = accessToken;
            RefreshToken = refreshToken;
        }
    }
}
