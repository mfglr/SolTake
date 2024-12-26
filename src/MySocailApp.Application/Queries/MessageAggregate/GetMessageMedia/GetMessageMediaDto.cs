using MediatR;

namespace MySocailApp.Application.Queries.MessageAggregate.GetMessageMedia
{
    public record GetMessageMediaDto(int MessageId, int Index) : IRequest<Stream>;
}
