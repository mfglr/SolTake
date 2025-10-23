using SolTake.Core.Media;

namespace SolTake.QuestionService.Application
{
    internal class MediaGenerator
    {
        public IEnumerable<Media> Generate(string containerName, IEnumerable<MediaType> types, IEnumerable<string> blobNames)
        {
            List<Media> media = [];
            for(int i = 0; i < types.Count(); i++)
                media.Add(new Media(containerName, blobNames.ElementAt(i), types.ElementAt(i)));
            return media;
        }
    }
}
