using MySocailApp.Domain.QuestionAggregate;
using System.Drawing;

namespace MySocailApp.Infrastructure.QuestionAggregate
{
    public class QuestionImageDimentionCalculator : IQuestionImageDimentionCalculator
    {
        public QuestionImageDimention Calculate(Stream stream)
        {
            using var image = Image.FromStream(stream);
            if (image == null)
                return new QuestionImageDimention(0, 0);
            return new(image.Height, image.Width);
        }
    }
}
