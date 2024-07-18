using FluentValidation;

namespace MySocailApp.Application.Commands.SolutionAggregate.CreateSolution
{
    public class CreateSolutionValidator : AbstractValidator<CreateSolutionDto>
    {
        public CreateSolutionValidator()
        {
            RuleFor(x => x.Images.Count)
                .LessThanOrEqualTo(10)
                .WithMessage("You can upload up to 10 image per solution");
        }
    }
}
