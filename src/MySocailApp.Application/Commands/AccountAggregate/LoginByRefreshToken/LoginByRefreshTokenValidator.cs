using FluentValidation;

namespace MySocailApp.Application.Commands.AccountAggregate.LoginByRefreshToken
{
    public class LoginByRefreshTokenValidator : AbstractValidator<LoginByRefreshTokenDto>
    {
        public LoginByRefreshTokenValidator()
        {
            RuleFor(x => x.Token).NotNull().NotEmpty().WithMessage("A refresh token is required!");
            RuleFor(x => x.Id).NotNull().NotEmpty().WithMessage("An id is required!");
        }
    }
}
