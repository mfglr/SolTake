using FluentValidation;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdatePassword
{
    public class UpdatePasswordValidator : AbstractValidator<UpdatePasswordDto>
    {
        public UpdatePasswordValidator()
        {
            RuleFor(x => x.CurrentPassword).NotNull().NotEmpty().WithMessage("The current password is required!");
            RuleFor(x => x.NewPassword).NotNull().NotEmpty().WithMessage("A new password is required!");
            RuleFor(x => x).Must(x => x.NewPassword == x.NewPasswordConfirmation).WithMessage("The new password confirmation does not match!");
        }
    }
}
