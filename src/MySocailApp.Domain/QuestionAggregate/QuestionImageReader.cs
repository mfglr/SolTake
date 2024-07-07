using MySocailApp.Domain.AppUserAggregate.Exceptions;
using MySocailApp.Domain.PostAggregate;

namespace MySocailApp.Domain.QuestionAggregate
{
    public class QuestionImageReader(IQuestionImageBlobService imageBlobService)
    {
        private readonly IQuestionImageBlobService _imageBlobService = imageBlobService;

        public Stream Read(Question question,string blobName)
        {
            if (!question.HasBlobName(blobName))
                throw new InvalidBlobName(blobName);
            return _imageBlobService.Read(blobName);
        }
    }
}
