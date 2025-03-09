using MySocailApp.Application.Queries.SolutionDomain;
using MySocailApp.Core;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionDomain.SolutionAggregate.ValueObjects;
using MySocailApp.Domain.UserDomain.UserAggregate.Entities;

namespace MySocailApp.Application.Commands.SolutionDomain.SolutionAggregate.CreateSolution
{
    public class CreateSolutionResponseDto(Solution solution, User user)
    {
        public int Id { get; private set; } = solution.Id;
        public DateTime CreatedAt { get; private set; } = solution.CreatedAt;
        public DateTime? UpdatedAt { get; private set; } = solution.UpdatedAt;
        public int QuestionId { get; private set; } = solution.QuestionId;
        public string UserName { get; private set; } = user.UserName.Value;
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
        public IEnumerable<SolutionMediaResponseDto> Medias { get; private set; } = solution.Medias
                .Select(x => new SolutionMediaResponseDto(
                    x.Id,
                    x.SolutionId,
                    x.ContainerName,
                    x.BlobName,
                    x.BlobNameOfFrame,
                    x.Size,
                    x.Height,
                    x.Width,
                    x.Duration,
                    x.MultimediaType
                ));
        public Multimedia? Image { get; private set; } = user.Image;
        public bool IsCreatedByAI { get; private set; } = solution.IsCreatedByAI;
        public string? AiModelName { get; private set; } = solution.Model?.Name;
    }
}
