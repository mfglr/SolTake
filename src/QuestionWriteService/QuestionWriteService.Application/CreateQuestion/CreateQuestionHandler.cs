using MediatR;

namespace QuestionWriteService.Application.CreateQuestion
{
    public class CreateQuestionHandler(IQuestionGrain questionGrain) : IRequestHandler<CreateQuestionDto, Guid>
    {
        private readonly IQuestionGrain _questionGrain = questionGrain;

        public Task<Guid> Handle(CreateQuestionDto request, CancellationToken cancellationToken)
        {
            
        }
    }
}
