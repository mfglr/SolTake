using MediatR;

namespace SolTake.Application.Commands.SubjectRequestAggregate.Approve
{
    public record ApproveSubjectRequestDto(int Id) : IRequest;
}
