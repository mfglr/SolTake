using MySocailApp.Application.InfrastructureServices.BlobService;

namespace MySocailApp.Infrastructure.InfrastructureServices.BlobService
{
    public class PathsContainer : IPathsContainer
    {
        private readonly List<string> _paths = [];
        public IReadOnlyList<string> Paths => _paths;
        public void Add(string path) => _paths.Add(path);

        public void Rollback()
        {
            foreach (var path in _paths)
                if (File.Exists(path))
                    File.Delete(path);
            _paths.Clear();
        }
    }
}
