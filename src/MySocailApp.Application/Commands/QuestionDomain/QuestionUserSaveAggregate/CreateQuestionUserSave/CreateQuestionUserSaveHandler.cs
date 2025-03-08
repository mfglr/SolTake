using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.QuestionDomain.QuestionUserSaveAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionUserSaveAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.QuestionUserSaveAggregate.Exceptions;

namespace MySocailApp.Application.Commands.QuestionDomain.QuestionUserSaveAggregate.CreateQuestionUserSave
{
    public class CreateQuestionUserSaveHandler(IUnitOfWork unitOfWork, IQuestionUserSaveWriteRepository questionUserSaveWriteRepository, IUserAccessor userAccessor, IQuestionUserSaveReadRepository questionUserSaveReadRepository) : IRequestHandler<CreateQuestionUserSaveDto, CreateQuestionUserSaveResponseDto>
    {
        private readonly IQuestionUserSaveReadRepository _questionUserSaveReadRepository = questionUserSaveReadRepository;
        private readonly IQuestionUserSaveWriteRepository _questionUserSaveWriteRepository = questionUserSaveWriteRepository;
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;

        public async Task<CreateQuestionUserSaveResponseDto> Handle(CreateQuestionUserSaveDto request, CancellationToken cancellationToken)
        {
            if (await _questionUserSaveReadRepository.ExistAsync(request.QuestionId,_userAccessor.User.Id,cancellationToken))
                throw new QuestionAlreadySavedException();

            var save = QuestionUserSave.Create(request.QuestionId, _userAccessor.User.Id);
            await _questionUserSaveWriteRepository.CreateAsync(save, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);

            return new(save.Id);
        }
    }
}
