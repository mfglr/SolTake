namespace SolTake.Application.InfrastructureServices.BlobService
{
    public interface IFrameCatcher
    {
        string CatchFrame(string contaninerName, string blobName, double position);
        byte[] CatchFrameToBytes(string contaninerName, string blobName, double position);

    }
}
