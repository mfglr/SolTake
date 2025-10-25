using MassTransit;
using SolTake.ExamService.Domain;

namespace SolTake.ExamService.Application.ApplicationServices.GetById
{
    internal class GetByIdHandler(IExamRepository examRepository) : IConsumer<GetByIdDto>
    {
        private readonly IExamRepository _examRepository = examRepository;

        public async Task Consume(ConsumeContext<GetByIdDto> context)
        {
            var exam =
                await _examRepository.GetByIdAsync(new(context.Message.Name), context.CancellationToken) ??
                throw new ExamNotFoundException();
            await context.RespondAsync(
                new GetByIdResponseDto(
                    exam.Name.Value,
                    exam.Initialism.Value,
                    exam.Subjects.Select(x => x.Value)
                )
            );
        }
    }
}
