using MySocailApp.Core;

namespace MySocailApp.Application.Queries.CommentAggregate
{
    public record CommentResponseDto(int Id, DateTime CreatedAt,DateTime? UpdatedAt, string UserName, int UserId,bool IsEdited,string Content,bool IsLiked,int NumberOfLikes,int NumberOfReplies, bool IsOwner, int? QuestionId,int? SolutionId,int? ParentId, Multimedia? Image);
}
