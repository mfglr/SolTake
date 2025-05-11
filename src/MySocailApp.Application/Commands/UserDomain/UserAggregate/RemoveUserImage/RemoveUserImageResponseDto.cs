using MySocailApp.Domain.UserAggregate.Entities;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.RemoveUserImage
{
    public class RemoveUserImageResponseDto(User User)
    {
        public string AccessToken { get; private set; } = User.AccessToken;
        public string RefreshToken { get; private set; } = User.RefreshTokens.Last().Value;
    }
}
