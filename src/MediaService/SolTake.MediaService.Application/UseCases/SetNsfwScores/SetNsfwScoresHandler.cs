using MassTransit;
using SolTake.MediaService.Domain;

namespace SolTake.MediaService.Application.UseCases.SetNsfwScores
{
    internal class SetNsfwScoresHandler(IMediaRepository mediaRepository) : IConsumer<SetNsfwScores>
    {
        private readonly IMediaRepository _mediaRepository = mediaRepository;

        public async Task Consume(ConsumeContext<SetNsfwScores> context)
        {
            var media = await _mediaRepository.GetByIdAsync(context.Message.Id, context.CancellationToken);
            if (media == null) return;
            media.SetNsfwScores(context.Message.Scores);
            await _mediaRepository.UpdateAsync(media,context.CancellationToken);
        }
    }
}
