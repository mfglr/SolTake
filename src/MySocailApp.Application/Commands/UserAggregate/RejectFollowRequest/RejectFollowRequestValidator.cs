using FluentValidation;

namespace MySocailApp.Application.Commands.UserAggregate.RejectFollowRequest
{
    public class RejectFollowRequestValidator : AbstractValidator<RejectFollowRequestDto>
    {
        public RejectFollowRequestValidator()
        {
            RuleFor(x => x.RequesterId).NotEmpty().NotNull().WithMessage("A requester id is required!");
        }
    }
}
