using FluentValidation;

namespace MySocailApp.Application.Commands.AccountAggregate.ConfirmEmailByToken
{
    public class ConfirmEmailByTokenValidator : AbstractValidator<ConfirmEmailByTokenDto>
    {
        public ConfirmEmailByTokenValidator()
        {
            RuleFor(x => x.Token).NotNull().NotEmpty().WithMessage("A token is required to confirm your email!");
        }
    }
}
