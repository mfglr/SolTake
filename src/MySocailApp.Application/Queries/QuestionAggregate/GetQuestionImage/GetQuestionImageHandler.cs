using MediatR;
using MySocailApp.Application.Extentions;
using MySocailApp.Domain.QuestionAggregate;
using MySocailApp.Domain.QuestionAggregate.Excpetions;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetQuestionImage
{
    public class GetQuestionImageHandler(QuestionImageReader reader, IQuestionReadRepository repository) : IRequestHandler<GetQuestionImageDto, byte[]>
    {
        private readonly QuestionImageReader _reader = reader;
        private readonly IQuestionReadRepository _repository = repository;

        public async Task<byte[]> Handle(GetQuestionImageDto request, CancellationToken cancellationToken)
        {
            var question = 
                await _repository.GetByIdAsync(request.QuestionId, cancellationToken) ?? 
                throw new QuestionIsNotFoundException();

            return await _reader.Read(question, request.BlobName).ToByteArrayAsync();
        }
    }
}
