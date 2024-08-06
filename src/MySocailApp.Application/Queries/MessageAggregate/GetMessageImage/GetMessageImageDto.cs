using MediatR;

namespace MySocailApp.Application.Queries.MessageAggregate.GetMessageImage
{
    public record GetMessageImageDto(int MessageId,int MessageImageId) : IRequest<byte[]>;
}
