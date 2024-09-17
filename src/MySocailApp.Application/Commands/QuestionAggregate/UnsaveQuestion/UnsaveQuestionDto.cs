using MediatR;

namespace MySocailApp.Application.Commands.QuestionAggregate.UnsaveQuestion
{
    public record UnsaveQuestionDto(int QuestionId) : IRequest;
}
