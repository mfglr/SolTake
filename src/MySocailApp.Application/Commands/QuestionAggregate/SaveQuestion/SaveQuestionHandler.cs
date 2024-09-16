using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Domain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.QuestionAggregate.Interfaces;

namespace MySocailApp.Application.Commands.QuestionAggregate.SaveQuestion
{
    public class SaveQuestionHandler(IQuestionWriteRepository questionWriteRepositor, IMapper mapper, IAccessTokenReader accessTokenReader, IUnitOfWork unitOfWork) : IRequestHandler<SaveQuestionDto, SaveQuestionCommandResponseDto>
    {
        private readonly IQuestionWriteRepository _questionWriteRepository = questionWriteRepositor;
        private readonly IMapper _mapper = mapper;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;

        public async Task<SaveQuestionCommandResponseDto> Handle(SaveQuestionDto request, CancellationToken cancellationToken)
        {
            var saverId = _accessTokenReader.GetRequiredAccountId();
            var question =
                await _questionWriteRepository.GetQuestionWithSaveAsync(request.QuestionId, saverId, cancellationToken) ??
                throw new QuestionNotFoundException();
            var save = question.Save(saverId);
            await _unitOfWork.CommitAsync(cancellationToken);
            return _mapper.Map<SaveQuestionCommandResponseDto>(save);
        }
    }
}
