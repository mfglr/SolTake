using SolTake.ThumbnailGenerator.Application;
using Xabe.FFmpeg;

namespace SolTake.ThumbnailGenerator.Infrastructure
{
    internal class ThumbnailGenerator(ITempDirectoryManager tempDirectoryManager, PathFinder pathFinder, UniqNameGenerator uniqNameGenerator) : IThumbnailGenerator
    {
        private readonly ITempDirectoryManager _tempDirectoryManager = tempDirectoryManager;
        private readonly PathFinder _pathFinder = pathFinder;
        private readonly UniqNameGenerator _uniqNameGenerator = uniqNameGenerator;

        public async Task<Stream> GenerateAsync(Stream stream, double resulation, bool isSquare, CancellationToken cancellationToken)
        {
            FFmpeg.SetExecutablesPath(_pathFinder.GetContainerPath("FFmpeg"));

            var inputPath = await _tempDirectoryManager.AddAsync(stream, cancellationToken);

            var blobName = _uniqNameGenerator.Generate("jpg");
            var outputPath = _pathFinder.GetPath(_tempDirectoryManager.ScopeContainerName, blobName);

            string filter;
            if (isSquare)
                filter = $"crop='if(gt(iw,ih),ih,iw):if(gt(iw,ih),ih,iw):(iw-if(gt(iw,ih),ih,iw))/2:(ih-if(gt(iw,ih),ih,iw))/2',scale='if(gt(iw,ih),if(gt({resulation},ih),ih,{resulation}),if(gt({resulation},iw),iw,{resulation})):if(gt(iw,ih),if(gt({resulation},ih),ih,{resulation}),if(gt({resulation},iw),iw,{resulation}))'";
            else
                filter = $"scale='if(gt(iw,ih),if(gt({resulation},iw),iw,{resulation}),-2)':'if(gt(ih,iw),if(gt({resulation},ih),ih,{resulation}),-2)'";

            await FFmpeg.Conversions.New()
                .AddParameter($"-i \"{inputPath}\"")
                .AddParameter($"-vf {filter}")
                .AddParameter("-vframes 1")
                .SetOutput($"{outputPath}")
                .Start(cancellationToken);

            return await _tempDirectoryManager.ReadAsync(blobName, cancellationToken);

        }
    }
}
