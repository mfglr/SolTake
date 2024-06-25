using FluentValidation;

namespace MySocailApp.Application.Commands.AccountAggregate.LoginByPassword
{
    public class LoginByPasswordValidator : AbstractValidator<LoginByPasswordDto>
    {
        public LoginByPasswordValidator()
        {
            RuleFor(x => x.Password).NotNull().NotEmpty().WithMessage("The password field is required");
            RuleFor(x => x.EmailOrUserName).NotNull().NotEmpty().WithMessage("An email or a user name is required");
        }
    }
}
