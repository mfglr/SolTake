using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.ExamAggregate.Entitities;
using SolTake.Domain.ExamAggregate.Interfaces;

namespace SolTake.Application.Commands.ExamAggregate.Create
{
    public class CreateExamHandler(IExamWriteRepository examWriteRepository, IUnitOfWork unitOfWork) : IRequestHandler<CreateExamDto, CreateExamResponseDto>
    {
        private readonly IExamWriteRepository _examWriteRepository = examWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task<CreateExamResponseDto> Handle(CreateExamDto request, CancellationToken cancellationToken)
        {
            var exam = new Exam(request.ShortName, request.FullName);
            await _examWriteRepository.CreateAsync(exam, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);
            return new(exam.Id, exam.ShortName, exam.FullName);
        }
    }
}
