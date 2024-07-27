using MediatR;

namespace MySocailApp.Application.Queries.CommentAggregate.GetCommentByParentId
{
    public record GetCommentsByParentIdDto(int ParentId,int? LastId,int? Take) : IRequest<List<CommentResponseDto>>;
}
