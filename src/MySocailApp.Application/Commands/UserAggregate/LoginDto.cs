using MySocailApp.Domain.UserDomain.UserAggregate.Entities;

namespace MySocailApp.Application.Commands.UserAggregate
{
    public class LoginDto(User user)
    {
        public int Id { get; private set; } = user.Id;
        public DateTime CreatedAt { get; private set; } = user.CreatedAt;
        public DateTime? UpdatedAt { get; private set; } = user.UpdatedAt;
        public string Email { get; private set; } = user.Email.Value;
        public bool IsEmailVerified { get; private set; } = user.IsEmailVerified;
        public string Language { get; private set; } = user.Language.Value;
        public string AccessToken { get; private set; } = user.AccessToken;
        public string RefreshToken { get; private set; } = user.RefreshToken;
        public bool IsPrivacyPolicyApproved { get; private set; } = user.IsPrivacyPolicyApproved;
        public bool IsTermsOfUseApproved { get; private set; } = user.IsTersmOfUseApproved;
        public bool IsGoogleAuthenticated { get; private set; } = user.GoogleAccount != null;
    }
}
