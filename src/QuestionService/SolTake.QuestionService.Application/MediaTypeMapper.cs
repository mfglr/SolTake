using Microsoft.AspNetCore.Http;
using SolTake.Core.Media;
using SolTake.QuestionService.Application.Exceptions;

namespace SolTake.QuestionService.Application
{
    internal class MediaTypeMapper
    {
        public IEnumerable<MediaType> GetTypes(IFormFileCollection media) =>
            media.Select(x => {
                if (x.ContentType.StartsWith("image"))
                    return MediaType.Image;
                if(x.ContentType.StartsWith("video"))
                    return MediaType.Video;
                throw new InvlidMediaType();
            });
    }
}
