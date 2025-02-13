using MediatR;

namespace MySocailApp.Application.Commands.QuestionDomain.QuestionAggregate.UnsaveQuestion
{
    public record UnsaveQuestionDto(int QuestionId) : IRequest;
}
