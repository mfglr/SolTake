using MediatR;

namespace MySocailApp.Application.Commands.QuestionAggregate.DislikeQuestion
{
    public record DislikeQuestionDto(int QuestionId) : IRequest;
}
