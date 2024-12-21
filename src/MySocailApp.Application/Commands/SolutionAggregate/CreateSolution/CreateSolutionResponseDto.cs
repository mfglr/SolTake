using MySocailApp.Application.Queries.SolutionAggregate;
using MySocailApp.Domain.AccountDomain.AccountAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.Entities;
using MySocailApp.Domain.SolutionAggregate.ValueObjects;

namespace MySocailApp.Application.Commands.SolutionAggregate.CreateSolution
{
    public class CreateSolutionResponseDto(Solution solution, Account account)
    {
        public int Id { get; private set; } = solution.Id;
        public DateTime CreatedAt { get; private set; } = solution.CreatedAt;
        public DateTime? UpdatedAt { get; private set; } = solution.UpdatedAt;
        public int QuestionId { get; private set; } = solution.QuestionId;
        public string UserName { get; private set; } = account.UserName.Value;
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
                    x.Size,
                    x.Height,
                    x.Width,
                    x.Duration,
                    x.MultimediaType
                ));
    }
}
