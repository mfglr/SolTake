using MediatR;

namespace SolTake.Application.Commands.QuestionDomain.QuestionAggregate.PublishQuestion
{
    public record PublishQuestionDto(int QuestionId) : IRequest;
}
