using SolTake.Domain.UserAggregate.Entities;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdateUserName
{
    public class UpdateUserNameResponseDto
    {
        public string AccessToken { get; private set; }
        public string RefreshToken { get; private set; }

        public UpdateUserNameResponseDto(string accessToken, string refreshToken)
        {
            AccessToken = accessToken;
            RefreshToken = refreshToken;
        }

        public UpdateUserNameResponseDto(User user)
        {
            AccessToken = user.AccessToken;
            RefreshToken = user.RefreshTokens.Last().Value;
        }
    }
}
