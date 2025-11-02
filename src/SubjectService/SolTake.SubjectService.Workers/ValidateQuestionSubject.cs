using MassTransit;
using SolTake.Core.Events.QuestionEvents;
using SolTake.SubjectService.Domain;

namespace SolTake.SubjectService.Workers
{
    public class ValidateQuestionSubject(ISubjectRepository subjectRepository, IPublishEndpoint publishEndpoint) : IConsumer<QuestionCreated>
    {
        private readonly ISubjectRepository _subjectRepository = subjectRepository;
        private readonly IPublishEndpoint _publishEndpoint = publishEndpoint;

        public async Task Consume(ConsumeContext<QuestionCreated> context)
        {
            var subject = await _subjectRepository.GetByIdAsync(context.Message.SubjectId, context.CancellationToken);
            if(subject == null)
            {
                await _publishEndpoint.Publish(
                    new ValidateQuestionSubjectFailed(context.Message.Id),
                    context.CancellationToken
                );
            }
            else
            {
                await _publishEndpoint.Publish(
                    new ValidateQuestionSubjectSuccess(context.Message.Id),
                    context.CancellationToken
                );
            }
        }
    }
}
