using AutoMapper;
using MediatR;
using MySocailApp.Application.ApplicationServices;
using MySocailApp.Application.Queries.QuestionAggregate;
using MySocailApp.Domain.QuestionAggregate.Excpetions;
using MySocailApp.Domain.QuestionAggregate.Interfaces;

namespace MySocailApp.Application.Commands.QuestionAggregate.LikeQuestion
{
    public class LikeQuestionHandler(IAccessTokenReader tokenReader, IQuestionWriteRepository repository, IUnitOfWork unitOfWork, IMapper mapper) : IRequestHandler<LikeQuestionDto,QuestionUserLikeResponseDto>
    {
        private readonly IAccessTokenReader _tokenReader = tokenReader;
        private readonly IQuestionWriteRepository _repository = repository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IMapper _mapper = mapper;

        public async Task<QuestionUserLikeResponseDto> Handle(LikeQuestionDto request, CancellationToken cancellationToken)
        {
            var userId = _tokenReader.GetRequiredAccountId();
            var question =
                await _repository.GetWithLikeByIdAsync(request.QuestionId, userId, cancellationToken) ??
                throw new QuestionNotFoundException();
            var like = question.Like(userId);
            await _unitOfWork.CommitAsync(cancellationToken);
            return _mapper.Map<QuestionUserLikeResponseDto>(like);
        }
    }
}
