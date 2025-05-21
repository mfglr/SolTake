using MediatR;

namespace SolTake.Application.Commands.QuestionDomain.QuestionAggregate.DeleteQuestion
{
    public record DeleteQuestionDto(int QuestionId) : IRequest;
}
