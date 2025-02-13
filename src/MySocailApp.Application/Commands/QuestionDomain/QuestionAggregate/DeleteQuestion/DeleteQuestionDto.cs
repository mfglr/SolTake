using MediatR;

namespace MySocailApp.Application.Commands.QuestionDomain.QuestionAggregate.DeleteQuestion
{
    public record DeleteQuestionDto(int QuestionId) : IRequest;
}
