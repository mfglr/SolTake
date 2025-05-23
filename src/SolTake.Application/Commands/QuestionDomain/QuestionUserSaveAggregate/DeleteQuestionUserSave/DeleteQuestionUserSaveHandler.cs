using MediatR;
using SolTake.Application.InfrastructureServices;
using SolTake.Domain.QuestionDomain.QuestionUserSaveAggregate.Abstracts;
using SolTake.Domain.QuestionDomain.QuestionUserSaveAggregate.Exceptions;

namespace SolTake.Application.Commands.QuestionDomain.QuestionUserSaveAggregate.DeleteQuestionUserSave
{
    public class DeleteQuestionUserSaveHandler(IUnitOfWork unitOfWork, IQuestionUserSaveWriteRepository questionUserSaveWriteRepository, IUserAccessor userAccessor) : IRequestHandler<DeleteQuestionUserSaveDto>
    {
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IQuestionUserSaveWriteRepository _questionUserSaveWriteRepository = questionUserSaveWriteRepository;

        public async Task Handle(DeleteQuestionUserSaveDto request, CancellationToken cancellationToken)
        {
            var save = 
                await _questionUserSaveWriteRepository.GetAsync(request.QuestionId, _userAccessor.User.Id, cancellationToken) ??
                throw new QuestionNotSavedException();

            _questionUserSaveWriteRepository.Delete(save);

            await _unitOfWork.CommitAsync(cancellationToken);
        }
    }
}
