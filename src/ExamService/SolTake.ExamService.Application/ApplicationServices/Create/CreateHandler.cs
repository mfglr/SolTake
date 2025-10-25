using MassTransit;
using SolTake.Core.Events;
using SolTake.ExamService.Domain;

namespace SolTake.ExamService.Application.ApplicationServices.Create
{
    internal class CreateHandler(IExamRepository examRepository, IPublishEndpoint publishEndpoint, ExamCreatorDomainService examCreatorDomainService) : IConsumer<CreateDto>
    {
        private readonly IExamRepository _examRepository = examRepository;
        private readonly IPublishEndpoint _publishEndpoint = publishEndpoint;
        private readonly ExamCreatorDomainService _examCreatorDomainService = examCreatorDomainService;

        public async Task Consume(ConsumeContext<CreateDto> context)
        {
            var name = new ExamName(context.Message.Name);
            var initialism = new ExamInitialism(context.Message.Initialism);
            var exam = new Exam(name, initialism, []);

            await _examCreatorDomainService.CreateAsync(exam, context.CancellationToken);

            await _examRepository.CreateAsync(exam, context.CancellationToken);

            await _publishEndpoint.Publish(
                new ExamCreatedEvent(exam.Name.Value, exam.Initialism.Value),
                context.CancellationToken
            );
        }
    }
}
