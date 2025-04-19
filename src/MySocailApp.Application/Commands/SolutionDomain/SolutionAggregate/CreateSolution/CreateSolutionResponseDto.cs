using MySocailApp.Application.Queries.SolutionDomain;
using MySocailApp.Core;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.CreateSolution
{
    public class CreateSolutionResponseDto(Solution solution, Login login)
    {
        public int Id { get; private set; } = solution.Id;
        public DateTime CreatedAt { get; private set; } = solution.CreatedAt;
        public DateTime? UpdatedAt { get; private set; } = solution.UpdatedAt;
        public int QuestionId { get; private set; } = solution.QuestionId;
        public string UserName { get; private set; } = login.UserName;
        public int UserId { get; private set; } = solution.UserId;
        public string? Content { get; private set; } = solution.Content?.Value;
        public bool IsUpvoted { get; private set; } = false;
        public int NumberOfUpvotes { get; private set; } = 0;
        public bool IsDownvoted { get; private set; } = false;
        public int NumberOfDownvotes { get; private set; } = 0;
        public int NumberOfComments { get; private set; } = 0;
        public SolutionState State { get; private set; } = solution.State;
        public bool IsOwner { get; private set; } = true;
        public bool IsSaved { get; private set; } = false;
        public bool DoesBelongToQuestionOfCurrentUser { get; private set; } = false;
        public IEnumerable<Multimedia> Medias { get; private set; } = solution.Medias;
        public Multimedia? Image { get; private set; } = login.Image;
        public bool IsCreatedByAI { get; private set; } = solution.IsCreatedByAI;
        public string? AiModelName { get; private set; } = solution.Model?.Name;
    }
}
