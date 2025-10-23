using Microsoft.Extensions.Configuration;
using SolTake.Core.Media;
using SolTake.NsfwDetector.Application;

namespace SolTake.NsfwDetector.Infrastructure
{
    internal class NsfwDetector(NsfwResultToNsfsCategories nsfwResultToNsfsCategories, IConfiguration configuration, VideoFrameExtractor videoFrameExtractor, ImageFrameExtractor imageFrameExtractor, IInternalNsfwDetector internalNsfwDetector) : INsfwDetector
    {
        private readonly IConfiguration _configuration = configuration;
        private readonly IInternalNsfwDetector _internalNsfwDetector = internalNsfwDetector;
        private readonly NsfwResultToNsfsCategories _nsfwResultToNsfsCategories = nsfwResultToNsfsCategories;
        private readonly VideoFrameExtractor _videoFrameExtractor = videoFrameExtractor;
        private readonly ImageFrameExtractor _imageFrameExtractor = imageFrameExtractor;

        public async Task<IEnumerable<NsfwScore>> ClasifyAsync(string text, CancellationToken cancellationToken)
        {
            var scores = await _internalNsfwDetector.ClassifyAsync(text, cancellationToken);
            return _nsfwResultToNsfsCategories.Map(scores);
        }


        public async Task<IEnumerable<NsfwScore>> ClasifyAsync(string inputPath, string outputPath, MediaType type, CancellationToken cancellationToken)
        {
            int resulation = int.Parse(_configuration["NsfwDetector:Resulation"]!);
            int fps = int.Parse(_configuration["NsfwDetector:Fps"]!);

            NsfwScoreResult scores;
            if (type == MediaType.Video)
            {
                var paths = await _videoFrameExtractor.ExtractAsync(inputPath, outputPath, resulation, fps, cancellationToken);
                scores = await _internalNsfwDetector.ClassifyImagesAsync(paths, cancellationToken);
            }
            else
            {
                var path = await _imageFrameExtractor.ExtractAsync(inputPath, outputPath, resulation, cancellationToken);
                scores = await _internalNsfwDetector.ClassifyImageAsync(path, cancellationToken);
            }

            return _nsfwResultToNsfsCategories.Map(scores);
        }


    }
}
