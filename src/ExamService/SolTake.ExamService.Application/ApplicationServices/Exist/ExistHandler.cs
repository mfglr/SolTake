using MassTransit;
using SolTake.ExamService.Domain;

namespace SolTake.ExamService.Application.ApplicationServices.Exist
{
    internal class ExistHandler(IExamRepository examRepository) : IConsumer<ExistDto>
    {
        private readonly IExamRepository _examRepository = examRepository;

        public async Task Consume(ConsumeContext<ExistDto> context)
        {
            var value = await _examRepository.ExistAsync(new(context.Message.Name), context.CancellationToken);
            await context.RespondAsync(new ExistResponseDto(value));
        }
    }
}
