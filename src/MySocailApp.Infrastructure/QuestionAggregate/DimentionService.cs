using MySocailApp.Domain.QuestionAggregate;
using System.Drawing;

namespace MySocailApp.Infrastructure.QuestionAggregate
{
    public class DimentionService : IDimentionService
    {
        public Dimention GetDimension(Stream stream)
        {
            using var image = Image.FromStream(stream);
            if (image == null)
                return new Dimention(0, 0);
            return new(image.Height, image.Width);
        }
    }
}
