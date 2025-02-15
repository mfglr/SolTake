namespace MySocailApp.Application.Commands.UserAggregate
{
    public record AccountDto(int Id, DateTime CreatedAt, DateTime? UpdatedAt, string Email, bool IsEmailVerified, string Language, string AccessToken, string RefreshToken, bool IsPrivacyPolicyApproved, bool IsTermsOfUseApproved, bool IsGoogleAuthenticated);
}
