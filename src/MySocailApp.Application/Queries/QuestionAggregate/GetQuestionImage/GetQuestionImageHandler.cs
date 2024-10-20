using MediatR;
using MySocailApp.Application.InfrastructureServices.BlobService.ImageServices;
using MySocailApp.Application.InfrastructureServices.BlobService.Objects;
using MySocailApp.Domain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.QuestionAggregate.Excpetions;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetQuestionImage
{
    public class GetQuestionImageHandler(IQuestionReadRepository repository, IImageService blobService) : IRequestHandler<GetQuestionImageDto, byte[]>
    {
        private readonly IQuestionReadRepository _repository = repository;
        private readonly IImageService _blobService = blobService;

        public async Task<byte[]> Handle(GetQuestionImageDto request, CancellationToken cancellationToken)
        {
            var question =
                await _repository.GetQuestionWithImagesById(request.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();

            var image = 
                question.Images.FirstOrDefault(x => x.Id == request.QuestionImageId) ??
                throw new QuestionImageNotFoundException();

            return await _blobService.ReadAsync(ContainerName.QuestionImages, image.BlobName);
        }
    }
}
