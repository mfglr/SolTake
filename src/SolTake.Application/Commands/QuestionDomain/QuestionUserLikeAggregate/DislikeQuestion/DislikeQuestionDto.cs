using MediatR;

namespace MySocailApp.Application.Commands.QuestionDomain.QuestionUserLikeAggregate.DislikeQuestion
{
    public record DislikeQuestionDto(int QuestionId) : IRequest;
}
