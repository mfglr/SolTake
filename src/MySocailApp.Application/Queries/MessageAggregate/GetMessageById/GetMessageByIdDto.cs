using MediatR;

namespace MySocailApp.Application.Queries.MessageAggregate.GetMessageById
{
    public record GetMessageByIdDto(int MessageId) : IRequest<MessageResponseDto>;
}
