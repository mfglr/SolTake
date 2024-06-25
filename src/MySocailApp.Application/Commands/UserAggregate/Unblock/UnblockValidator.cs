using FluentValidation;

namespace MySocailApp.Application.Commands.UserAggregate.Unblock
{
    public class UnblockValidator : AbstractValidator<UnblockDto>
    {
        public UnblockValidator()
        {
            RuleFor(x => x.UserId).NotNull().NotEmpty().WithMessage("A user id is required!");
        }
    }
}
