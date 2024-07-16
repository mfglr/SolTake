using MediatR;

namespace MySocailApp.Application.Commands.QuestionAggregate.LikeQuestion
{
    public record LikeQuestionDto(int QuestionId) : IRequest;
}
