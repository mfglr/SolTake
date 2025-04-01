using MySocailApp.Core;
using MySocailApp.Domain.CommentDomain.CommentAggregate.ValueObjects;

namespace MySocailApp.Domain.CommentDomain.CommentAggregate.Entities
{
    public class Comment : Entity, IAggregateRoot
    {
        private Comment() { }

        public int UserId { get; private set; }
        public int? QuestionId { get; private set; }
        public int? SolutionId { get; private set; }
        public int? ParentId { get; private set; }
        public int? RepliedId { get; private set; }
        public bool IsEdited { get; private set; }
        public CommentContent Content { get; private set; } = null!;
        public readonly List<CommentUserTag> _tags = [];
        public IReadOnlyCollection<CommentUserTag> Tags => _tags;

        public Comment(int userId, CommentContent content, IEnumerable<int> idsOfUsersTagged)
        {
            UserId = userId;
            Content = content;
            _tags.AddRange(idsOfUsersTagged.Select(CommentUserTag.Create));
        }

        internal void CreateQuestionComment(int questionId)
        {
            QuestionId = questionId;
            UpdatedAt = CreatedAt = DateTime.UtcNow;
        }
        internal void CreateSolutionComment(int solutionId)
        {
            SolutionId = solutionId;
            UpdatedAt = CreatedAt = DateTime.UtcNow;
        }
        internal void ReplyComment(int parentId, int repliedId)
        {
            ParentId = parentId;
            RepliedId = repliedId;
            UpdatedAt = CreatedAt = DateTime.UtcNow;
        }

        public void Update(CommentContent content)
        {
            IsEdited = true;
            Content = content;
            UpdatedAt = DateTime.UtcNow;
        }

        public void SetRepliedIdNull() => RepliedId = null;

        public void DeleteTag(int userId)
        {
            var tag = _tags.FirstOrDefault(t => t.UserId == userId);
            if (tag != null)
                _tags.Remove(tag);
        }

    }
}
