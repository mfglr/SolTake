using MassTransit;
using SolTake.MediaManipulator.Application.TempManager;

namespace SolTake.MediaManipulator.Application.ApplicationServices.ManipulateVideo
{
    internal class ManipulateVideoHandler(PathFinder pathFinder, TempDirectoryManager tempDirectoryManager, IBlobService blobService, IVideoManipulator videoManipulator, UniqNameGenerator uniqNameGenerator) : IConsumer<ManipulateVideoDto>
    {
        private readonly UniqNameGenerator _uniqNameGenerator = uniqNameGenerator;
        private readonly PathFinder _pathFinder = pathFinder;
        private readonly TempDirectoryManager _tempDirectoryManager = tempDirectoryManager;
        private readonly IBlobService _blobService = blobService;
        private readonly IVideoManipulator _videoManipulator = videoManipulator;

        public async Task Consume(ConsumeContext<ManipulateVideoDto> context)
        {
            try
            {
                _tempDirectoryManager.Create();
                var stream = await _blobService.GetAsync(context.Message.ContainerName, context.Message.BlobName, context.CancellationToken);
                var inputPath = await _tempDirectoryManager.AddAsync(stream, context.CancellationToken);

                var blobName = _uniqNameGenerator.Generate("mp4");
                var outputPath = _pathFinder.GetPath(_tempDirectoryManager.ScopeContainerName, blobName);
                await _videoManipulator.ManipulateAsync(inputPath, outputPath, context.CancellationToken);
                var manipulatedStrem = _tempDirectoryManager.Read(blobName);

                var manipulationBlobName = $"{context.Message.BlobName}_manipulation";
                await _blobService.UploadAsync(manipulatedStrem, context.Message.ContainerName, manipulationBlobName, context.CancellationToken);

                stream.Close();
                stream.Dispose();

                manipulatedStrem.Close();
                manipulatedStrem.Dispose();

                _tempDirectoryManager.Delete();
            }
            catch (Exception)
            {
                _tempDirectoryManager.Delete();
                throw;
            }
        }
    }
}
