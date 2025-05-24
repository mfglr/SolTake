using Microsoft.AspNetCore.Http;
using SolTake.Application.InfrastructureServices.BlobService;
using SolTake.Application.InfrastructureServices.BlobService.Objects;
using SolTake.Infrastructure.InfrastructureServices.BlobService.InternalServices;
using SolTake.Core.Exceptions;

namespace SolTake.Infrastructure.InfrastructureServices.BlobService
{
    public class TempDirectoryService(IHttpContextAccessor contextAccessor, UniqNameGenerator uniqNameGenerator, IPathFinder pathFinder) : ITempDirectoryService
    {
        private readonly IHttpContextAccessor _contextAccessor = contextAccessor;
        private readonly UniqNameGenerator _uniqNameGenerator = uniqNameGenerator;
        private readonly IPathFinder _pathFinder = pathFinder;

        public void Create()
        {
            _contextAccessor.HttpContext!.TraceIdentifier = _uniqNameGenerator.Generate();
            Directory.CreateDirectory(_pathFinder.GetContainerPath(ContainerName.Temp));
        }
        public void Delete() => Directory.Delete(_pathFinder.GetContainerPath(ContainerName.Temp), true);

        public async Task<string> AddFile(Stream stream)
        {
            var blobName = _uniqNameGenerator.Generate();
            var path = _pathFinder.GetPath(ContainerName.Temp,blobName);

            if (File.Exists(path))
                throw new ServerSideException();

            using var fileStream = File.Create(path);
            await stream.CopyToAsync(fileStream);
            fileStream.Close();

            return blobName;
        }
    }
}
