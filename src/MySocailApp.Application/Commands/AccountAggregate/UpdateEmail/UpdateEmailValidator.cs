using FluentValidation;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdateEmail
{
    public class UpdateEmailValidator : AbstractValidator<UpdateEmailDto>
    {
        public UpdateEmailValidator()
        {
            RuleFor(x => x.Email).NotEmpty().WithMessage("An email is required!");
        }
    }
}
