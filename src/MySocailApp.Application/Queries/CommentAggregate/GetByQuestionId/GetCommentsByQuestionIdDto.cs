using MediatR;

namespace MySocailApp.Application.Queries.CommentAggregate.GetByQuestionId
{
    public record GetCommentsByQuestionIdDto(int QuestionId,int? LastId) : IRequest<List<CommentResponseDto>>;
}
