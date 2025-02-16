using MediatR;

namespace MySocailApp.Application.Commands.QuestionDomain.QuestionAggregate.SaveQuestion
{
    public record SaveQuestionDto(int QuestionId) : IRequest<SaveQuestionCommandResponseDto>;
}
