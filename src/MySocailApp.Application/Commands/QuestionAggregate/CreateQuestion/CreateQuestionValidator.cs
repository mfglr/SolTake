using FluentValidation;

namespace MySocailApp.Application.Commands.QuestionAggregate.CreateQuestion
{
    public class CreateQuestionValidator : AbstractValidator<CreateQuestionDto>
    {
        public CreateQuestionValidator()
        {
            RuleFor(x => x.Images.Count).GreaterThanOrEqualTo(1).WithMessage("You must upload an image at least!");
            RuleFor(x => x.Images.Count).LessThanOrEqualTo(5).WithMessage("You can upload up to 5 images!");
        }
    }
}
