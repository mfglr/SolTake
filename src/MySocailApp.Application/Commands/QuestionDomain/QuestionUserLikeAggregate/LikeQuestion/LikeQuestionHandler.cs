using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionAggregate.Exceptions;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Abstracts;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.DomainServices;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Entities;
using MySocailApp.Domain.QuestionDomain.QuestionUserLikeAggregate.Exceptions;

namespace MySocailApp.Application.Commands.QuestionDomain.QuestionUserLikeAggregate.LikeQuestion
{
    public class LikeQuestionHandler(IUnitOfWork unitOfWork, IAccessTokenReader accessTokenReader, QuestionUserLikeCreatorDomainService questionUserLikeCreatorDomainService, IQuestionUserLikeWriteRepository questionUserLikeWriteRepository, IQuestionReadRepository questionReadRepository, IQuestionUserLikeReadRepository questionUserLikeReadRepository) : IRequestHandler<LikeQuestionDto, LikeQuestionCommandResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IQuestionReadRepository _questionReadRepository = questionReadRepository;
        private readonly QuestionUserLikeCreatorDomainService _questionUserLikeCreatorDomainService = questionUserLikeCreatorDomainService;
        private readonly IQuestionUserLikeWriteRepository _questionUserLikeWriteRepository = questionUserLikeWriteRepository;
        private readonly IQuestionUserLikeReadRepository _questionUserLikeReadRepository = questionUserLikeReadRepository;

        public async Task<LikeQuestionCommandResponseDto> Handle(LikeQuestionDto request, CancellationToken cancellationToken)
        {
            var login = _accessTokenReader.GetLogin();

            var questionUserId =
                await _questionReadRepository.GetUserIdOfQuestionAsync(request.QuestionId, cancellationToken) ??
                throw new QuestionNotFoundException();

            if (await _questionUserLikeReadRepository.IsLikedAsync(request.QuestionId, login.UserId, cancellationToken))
                throw new QuestionAlreadyLikedException();

            var like = new QuestionUserLike(request.QuestionId, login.UserId);
            await _questionUserLikeCreatorDomainService.CreateAsync(like, login, questionUserId, cancellationToken);
            await _questionUserLikeWriteRepository.CreateAsync(like, cancellationToken);

            await _unitOfWork.CommitAsync(cancellationToken);

            return new(like, login);
        }
    }
}
