namespace SolTake.MediaManipulator.Application
{
    public interface IVideoManipulator
    {
        Task ManipulateAsync(string inputPath, string outputPath, CancellationToken cancellationToken);
    }
}
