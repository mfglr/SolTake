namespace MySocailApp.Application.ApplicationServices.BlobService
{
    public interface IPathsContainer
    {
        IReadOnlyList<string> Paths { get; }
        void Add(string path);
        void Rollback();
    }
}
