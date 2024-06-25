using FluentValidation;

namespace MySocailApp.Application.Commands.AccountAggregate.UpdateUserName
{
    public class UpdateUserNameValidator : AbstractValidator<UpdateUserNameDto>
    {
        public UpdateUserNameValidator()
        {
            RuleFor(x => x.UserName).NotNull().NotEmpty().WithMessage("A user name is required");
        }
    }
}
