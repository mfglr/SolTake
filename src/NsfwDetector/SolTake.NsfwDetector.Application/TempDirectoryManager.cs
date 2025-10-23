namespace SolTake.NsfwDetector.Application
{
    internal class TempDirectoryManager
    {
        private readonly UniqNameGenerator _uniqNameGenerator;
        private readonly PathFinder _pathFinder;

        public string ScopeContainerName { get; private set; }

        public TempDirectoryManager(UniqNameGenerator uniqNameGenerator, PathFinder pathFinder)
        {
            _uniqNameGenerator = uniqNameGenerator;
            _pathFinder = pathFinder;
            ScopeContainerName = $"Temp/{_uniqNameGenerator.Generate()}";
        }

        public Task Create(CancellationToken cancellationToken)
        {
            Directory.CreateDirectory(_pathFinder.GetContainerPath(ScopeContainerName));
            return Task.CompletedTask;
        }

        public async Task<string> AddAsync(Stream stream, CancellationToken cancellationToken)
        {
            var path = _pathFinder.GetPath(ScopeContainerName, _uniqNameGenerator.Generate());
            using var fileStream = File.Create(path);
            await stream.CopyToAsync(fileStream, cancellationToken);
            return path;
        }

        public Task Delete(CancellationToken cancellationToken)
        {
            var path = _pathFinder.GetContainerPath(ScopeContainerName);
            if (Directory.Exists(path))
                Directory.Delete(path, true);
            return Task.CompletedTask;
        }
    }
}
