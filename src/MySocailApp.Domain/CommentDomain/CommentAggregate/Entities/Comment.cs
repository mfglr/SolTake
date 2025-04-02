using MySocailApp.Core;
using MySocailApp.Domain.CommentDomain.CommentAggregate.DomainEvents;
using MySocailApp.Domain.CommentDomain.CommentAggregate.ValueObjects;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities;

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

        private void Create(Login login, Question? question = null, Solution? solution = null, Comment? parent = null)
        {
            CreatedAt = DateTime.UtcNow;
            AddDomainEvent(new CommentCreatedDomainEvent(this, login, Question: question,Solution: solution, Parent: parent));
            foreach (var tag in _tags)
                AddDomainEvent(new UserTaggedInCommentDomainEvent(this, tag.UserId, Question: question, Solution: solution, Parent: parent));
        }

        internal void CreateQuestionComment(Question question, Login login)
        {
            QuestionId = question.Id;
            CreatedAt = DateTime.UtcNow;
            
            Create(login, question: question);
        }

        internal void CreateSolutionComment(Solution solution,Login login)
        {
            SolutionId = solution.Id;
            Create(login, solution: solution);
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
