using MediatR;

namespace MySocailApp.Application.Commands.QuestionAggregate.DeleteQuestion
{
    public record DeleteQuestionDto(int QuestionId) : IRequest;
}
