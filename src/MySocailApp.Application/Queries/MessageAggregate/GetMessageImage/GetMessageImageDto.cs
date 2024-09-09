using MediatR;

namespace MySocailApp.Application.Queries.MessageAggregate.GetMessageImage
{
    public record GetMessageImageDto(int MessageId,int Index) : IRequest<byte[]>;
}
