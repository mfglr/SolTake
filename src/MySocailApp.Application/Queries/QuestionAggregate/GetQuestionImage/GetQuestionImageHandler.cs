using MediatR;
using MySocailApp.Application.Extentions;
using MySocailApp.Application.Services.BlobService;
using MySocailApp.Domain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.QuestionAggregate.Repositories;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetQuestionImage
{
    public class GetQuestionImageHandler(IQuestionReadRepository repository, IBlobService blobService) : IRequestHandler<GetQuestionImageDto, byte[]>
    {
        private readonly IQuestionReadRepository _repository = repository;
        private readonly IBlobService _blobService = blobService;

        public async Task<byte[]> Handle(GetQuestionImageDto request, CancellationToken cancellationToken)
        {
            var question =
                await _repository.GetByIdAsync(request.QuestionId, cancellationToken) ??
                throw new QuestionIsNotFoundException();

            if (!question.Images.Any(x => x.BlobName == request.BlobName))
                throw new QuestionImageIsNotFoundException();

            var stream = _blobService.Read(ContainerName.QuestionImages, request.BlobName);
            return await stream.ToByteArrayAsync();
        }
    }
}
