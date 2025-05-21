using MediatR;

namespace SolTake.Application.Commands.QuestionDomain.QuestionUserLikeAggregate.LikeQuestion
{
    public record LikeQuestionDto(int QuestionId) : IRequest<LikeQuestionCommandResponseDto>;
}
