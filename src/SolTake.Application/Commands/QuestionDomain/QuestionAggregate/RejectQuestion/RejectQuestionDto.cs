using MediatR;

namespace SolTake.Application.Commands.QuestionDomain.QuestionAggregate.RejectQuestion
{
    public record RejectQuestionDto(int QuestionId) : IRequest;
}
