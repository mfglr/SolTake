using MediatR;

namespace MySocailApp.Application.Commands.QuestionAggregate.SaveQuestion
{
    public record SaveQuestionDto(int QuestionId) : IRequest<SaveQuestionCommandResponseDto>;
}
