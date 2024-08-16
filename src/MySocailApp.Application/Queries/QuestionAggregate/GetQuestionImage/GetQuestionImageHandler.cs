using MediatR;
using MySocailApp.Application.ApplicationServices.BlobService;
using MySocailApp.Application.Extentions;
using MySocailApp.Domain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.QuestionAggregate.Interfaces;

namespace MySocailApp.Application.Queries.QuestionAggregate.GetQuestionImage
{
    public class GetQuestionImageHandler(IQuestionReadRepository repository, IBlobService blobService) : IRequestHandler<GetQuestionImageDto, byte[]>
    {
        private readonly IQuestionReadRepository _repository = repository;
        private readonly IBlobService _blobService = blobService;

        public async Task<byte[]> Handle(GetQuestionImageDto request, CancellationToken cancellationToken)
        {
            var question =
                await _repository.GetQuestionWithImagesById(request.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();

            var image = 
                question.Images.FirstOrDefault(x => x.Id == request.QuestionImageId) ??
                throw new QuestionImageNotFoundException();

            var stream = _blobService.Read(ContainerName.QuestionImages, image.BlobName);
            return await stream.ToByteArrayAsync();
        }
    }
}
