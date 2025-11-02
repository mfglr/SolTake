using MassTransit;
using SolTake.Core.Events.QuestionEvents;
using SolTake.ExamService.Domain;

namespace SolTake.ExamService.Workers
{
    public class ValidateQuestionExam(IPublishEndpoint publisheEndpoint, IExamRepository examRepository) : IConsumer<QuestionCreated>
    {
        private readonly IPublishEndpoint _publisheEndpoint = publisheEndpoint;
        private readonly IExamRepository _examRepository = examRepository;

        public async Task Consume(ConsumeContext<QuestionCreated> context)
        {
            var exam = await _examRepository.GetByIdAsync(context.Message.ExamId, context.CancellationToken);
            if(exam == null)
            {
                await _publisheEndpoint.Publish(
                    new ValidateQuestionExamFailed(
                        context.Message.Id,
                        Reason_ValidateExamFailed.ExamNotFound
                    ),
                    context.CancellationToken
                );
                return;
            }
                
            if(!exam.Subjects.Any(x => x == context.Message.SubjectId))
            {
                await _publisheEndpoint.Publish(
                    new ValidateQuestionExamFailed(
                        context.Message.Id,
                        Reason_ValidateExamFailed.SubjectNotBelong
                    ),
                    context.CancellationToken
                );
                return;
            }

            await _publisheEndpoint.Publish(
                new ValidateQuestionExamSuccess(context.Message.Id),
                context.CancellationToken
            );
        }
    }
}
