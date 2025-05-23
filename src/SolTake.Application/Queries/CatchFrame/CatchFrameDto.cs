using MediatR;

namespace SolTake.Application.Queries.CatchFrame
{
    public record CatchFrameDto(string ContainerName,string BlobName,double Position) : IRequest<byte[]>;
}
