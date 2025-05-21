using SolTake.Domain.UserAggregate.Entities;
using SolTake.Core;

namespace MySocailApp.Application.Commands.UserDomain.UserAggregate.UpdateUserImage
{
    public class UpdateUserImageResponseDto
    {
        public string AccessToken { get; private set; }
        public string RefreshToken { get; private set; }
        public Multimedia Image { get; private set; }

        public UpdateUserImageResponseDto(string accessToken, string refreshToken, Multimedia image)
        {
            AccessToken = accessToken;
            RefreshToken = refreshToken;
            Image = image;
        }

        public UpdateUserImageResponseDto(User user)
        {
            AccessToken = user.AccessToken;
            RefreshToken = user.RefreshTokens.Last().Value;
            Image = user.Image!;
        }
    }
}
