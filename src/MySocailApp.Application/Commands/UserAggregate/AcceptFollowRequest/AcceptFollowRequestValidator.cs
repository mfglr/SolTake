using FluentValidation;

namespace MySocailApp.Application.Commands.UserAggregate.AcceptFollowRequest
{
    public class AcceptFollowRequestValidator : AbstractValidator<AcceptFollowRequestDto>
    {
        public AcceptFollowRequestValidator()
        {
            RuleFor(x => x.RequesterId).NotNull().NotEmpty().WithMessage("A requester id is required!");
        }
    }
}
