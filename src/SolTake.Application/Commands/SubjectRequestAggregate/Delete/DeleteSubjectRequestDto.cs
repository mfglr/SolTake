using MediatR;

namespace SolTake.Application.Commands.SubjectRequestAggregate.Delete
{
    public record DeleteSubjectRequestDto(int Id) : IRequest;
}
