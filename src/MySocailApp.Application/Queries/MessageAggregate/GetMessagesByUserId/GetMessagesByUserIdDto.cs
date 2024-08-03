using MediatR;

namespace MySocailApp.Application.Queries.MessageAggregate.GetMessagesByUserId
{
    public record GetMessagesByUserIdDto(int UserId, int? LastValue, int? Take) : IRequest<List<MessageResponseDto>>;
}
