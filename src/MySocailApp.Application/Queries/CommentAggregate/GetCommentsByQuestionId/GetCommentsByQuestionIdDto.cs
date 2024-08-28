using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentsByQuestionId
{
    public class GetCommentsByQuestionIdDto(int questionId, int? offset, int take, bool isDescending) : Page(offset,take,isDescending), IRequest<List<CommentResponseDto>>
    {
        public int QuestionId { get; private set; } = questionId;
    }
}
