using FluentValidation;

namespace MySocailApp.Application.Commands.AccountAggregate.ConfirmEmail
{
    public class ConfirmEmailValidator : AbstractValidator<ConfirmEmailDto>
    {
        public ConfirmEmailValidator()
        {
            RuleFor(x => x.Id).NotNull().NotEmpty().WithMessage("Your account id is required to confirm your email!");
            RuleFor(x => x.Token).NotNull().NotEmpty().WithMessage("A token is required to confirm your email!");
        }
    }
}
