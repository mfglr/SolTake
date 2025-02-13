using MediatR;
using MySocailApp.Application.Queries.QuestionAggregate;

namespace MySocailApp.Application.Commands.QuestionDomain.QuestionUserLikeAggregate.LikeQuestion
{
    public record LikeQuestionDto(int QuestionId) : IRequest<LikeQuestionCommandResponseDto>;
}
