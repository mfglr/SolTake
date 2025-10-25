using SolTake.Core;

namespace SolTake.ThumbnailGenerator.Application.UseCases.CalculateMediaAspectRatios
{
    public record CalculateMediaAspectRatiosResponse(IEnumerable<Dimention> Dimentions);
}
