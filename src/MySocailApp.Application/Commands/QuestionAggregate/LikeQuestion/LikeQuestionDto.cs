using MediatR;
using MySocailApp.Application.Queries.QuestionAggregate;

namespace MySocailApp.Application.Commands.QuestionAggregate.LikeQuestion
{
    public record LikeQuestionDto(int QuestionId) : IRequest<QuestionUserLikeResponseDto>;
}
