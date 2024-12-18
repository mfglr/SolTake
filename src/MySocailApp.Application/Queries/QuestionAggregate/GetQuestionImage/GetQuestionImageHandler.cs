using MediatR;
using MySocailApp.Application.InfrastructureServices.BlobService;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Domain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.QuestionAggregate.Excpetions;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetQuestionImage
{
    public class GetQuestionImageHandler(IQuestionReadRepository repository, IBlobService blobService) : IRequestHandler<GetQuestionImageDto, Stream>
    {
        private readonly IQuestionReadRepository _repository = repository;
        private readonly IBlobService _blobService = blobService;

        public async Task<Stream> Handle(GetQuestionImageDto request, CancellationToken cancellationToken)
        {
            var question =
                await _repository.GetQuestionWithImagesById(request.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();

            var image = 
                question.Medias.FirstOrDefault(x => x.Id == request.QuestionImageId) ??
                throw new QuestionImageNotFoundException();

            var stream = await _blobService.ReadAsync(ContainerName.QuestionMedias, image.BlobName, cancellationToken);
            return stream;
        }
    }
}
