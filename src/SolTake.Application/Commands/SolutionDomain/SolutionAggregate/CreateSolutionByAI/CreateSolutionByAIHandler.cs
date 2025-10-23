using MediatR;
using OpenAI.Chat;
using SolTake.Application.Extentions;
using SolTake.Application.InfrastructureServices;
using SolTake.Application.InfrastructureServices.BlobService;
using SolTake.Application.InfrastructureServices.OpenAIService;
using SolTake.Domain.AIModelAggregate.Abstracts;
using SolTake.Domain.AIModelAggregate.Exceptions;
using SolTake.Domain.QuestionAggregate.Abstracts;
using SolTake.Domain.SolutionAggregate.Abstracts;
using SolTake.Domain.SolutionAggregate.Entities;
using SolTake.Domain.SolutionAggregate.ValueObjects;
using System.ClientModel;

namespace SolTake.Application.Commands.SolutionDomain.SolutionAggregate.CreateSolutionByAI
{
    public class CreateSolutionByAIHandler(ISolutionWriteRepository solutionWriteRepository, IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader, IPublisher publisher, IAIModelCacheService aiModelCacheService, ChatClientProvider chatClientProvider, IFrameCatcher frameCathcer, IQuestionReadRepository questionReadRepository) : IRequestHandler<CreateSolutionByAIDto, CreateSolutionByAIResponseDto>
    {
        private readonly ISolutionWriteRepository _solutionWriteRepository = solutionWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IPublisher _publisher = publisher;
        private readonly IAIModelCacheService _aiModelCacheService = aiModelCacheService;
        private readonly ChatClientProvider _chatClientProvider = chatClientProvider;
        private readonly IFrameCatcher _frameCathcer = frameCathcer;
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;

        private static async Task<IEnumerable<ChatMessage>> GenerateChatMessages(CreateSolutionByAIDto request, CancellationToken cancellationToken)
        {
            var prompt = ChatMessageContentPart.CreateTextPart(request.Prompt);

            if (request.BlobName == null)
                return [new UserChatMessage([prompt])];

            //using var stream = request.File.OpenReadStream();
            //var bytes = await stream.ToByteArrayAsync(cancellationToken);
            //var binaryData = new BinaryData(bytes);
            //var vision = ChatMessageContentPart.CreateImagePart(binaryData, "image/webp", imageDetailLevel: ChatImageDetailLevel.High);

            return [new UserChatMessage([prompt])];
        }

        public async Task<CreateSolutionByAIResponseDto> Handle(CreateSolutionByAIDto request, CancellationToken cancellationToken)
        {
            var model = _aiModelCacheService.Get(request.ModelId) ?? throw new AIModelNotFoundException();
            var client = _chatClientProvider.Get(model.Name.Value);
            var messages = await GenerateChatMessages(request, cancellationToken);
            ClientResult<ChatCompletion> result = await client.CompleteChatAsync(messages, cancellationToken: cancellationToken);
            var content = result?.Value.Content.First().Text;

            //create solution
            var userId = _accessTokenReader.GetRequiredAccountId();
            var solutionContent = new SolutionContent(content);
            var solution = new Solution(request.QuestionId, userId, solutionContent, model.Id);
            solution.Create();
            await _solutionWriteRepository.CreateAsync(solution, cancellationToken);

            //comit changes
            await _unitOfWork.CommitAsync(cancellationToken);
            //await _publisher.Publish(new SolutionCreatedDomainEvent(question, solution, login), cancellationToken);

            return new(solution.Id);
        }
    }
}
