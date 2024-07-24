using FluentValidation;
using MySocailApp.Domain.AccountAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.AccountAggregate.CreateAccount
{
    public class CreateAccountValidator : AbstractValidator<CreateAccountDto>
    {
        public CreateAccountValidator()
        {
            RuleFor(x => x.Email).NotNull().NotEmpty().WithMessage("An email is required");
            RuleFor(x => x.Password).NotNull().NotEmpty().WithMessage("A password is required");
            RuleFor(x => x)
                .Must(x => x.Password == x.PasswordConfirm)
                .WithMessage("The password and the password confirmation does not macth!");
            RuleFor(x => x.Email)
                .Must(Email.IsValid)
                .WithMessage("The email is not valid!");
        }
    }
}
