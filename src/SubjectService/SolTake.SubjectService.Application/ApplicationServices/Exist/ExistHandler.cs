using MassTransit;
using SolTake.SubjectService.Domain;

namespace SolTake.SubjectService.Application.ApplicationServices.Exist
{
    internal class ExistHandler(ISubjectRepository subjectRepository) : IConsumer<ExistDto>
    {
        private readonly ISubjectRepository _subjectRepository = subjectRepository;

        public async Task Consume(ConsumeContext<ExistDto> context)
        {
            var value = await _subjectRepository.ExistAsync(new(context.Message.Name), context.CancellationToken);
            await context.RespondAsync(new ExistResponseDto(value));
        }
    }
}
