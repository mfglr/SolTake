using MediatR;
using MySocailApp.Core;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentsByParentId
{
    public class GetCommentsByParentIdDto(int parentId, int offset, int take, bool isDescending) : Page(offset,take,isDescending), IRequest<List<CommentResponseDto>>
    {
        public int ParentId { get; private set; } = parentId;
    }
}
