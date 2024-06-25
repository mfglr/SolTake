using FluentValidation;

namespace MySocailApp.Application.Commands.UserAggregate.MakeFollowRequest
{
    public class MakeFollowRequestValidator : AbstractValidator<MakeFollowRequestDto>
    {
        public MakeFollowRequestValidator()
        {
            RuleFor(x => x.RequestedId).NotNull().NotEmpty().WithMessage("A user id is required!");
        }
    }
}
