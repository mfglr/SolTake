using MassTransit;
using SolTake.SubjectService.Domain;

namespace SolTake.SubjectService.Application.ApplicationServices.Create
{
    internal class CreateHandler(ISubjectRepository subjectRepository, SubjectCreator subjectCreator) : IConsumer<CreateDto>
    {
        private readonly ISubjectRepository _subjectRepository = subjectRepository;
        private readonly SubjectCreator _subjectCreator = subjectCreator;

        public async Task Consume(ConsumeContext<CreateDto> context)
        {
            var name = new SubjectName(context.Message.Name);
            var subject = new Subject(name);
            await _subjectCreator.CreateAsync(subject, context.CancellationToken);
            await _subjectRepository.CreateAsync(subject, context.CancellationToken);
        }
    }
}
