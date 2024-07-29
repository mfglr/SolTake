using AutoMapper;
using MediatR;
using MySocailApp.Application.Queries.CommentAggregate;
using MySocailApp.Application.Services;
using MySocailApp.Domain.AccountAggregate.Abstracts;
using MySocailApp.Domain.CommentAggregate.DomainServices;
using MySocailApp.Domain.CommentAggregate.Entities;
using MySocailApp.Domain.CommentAggregate.Interfaces;
using MySocailApp.Domain.CommentAggregate.ValueObjects;
using MySocailApp.Domain.NotificationAggregate.DomainServices;
using MySocailApp.Domain.NotificationAggregate.Entities;
using MySocailApp.Domain.NotificationAggregate.Interfaces;

namespace MySocailApp.Application.Commands.CommentAggregate.Create
{
    public class CreateCommentHandler(ICommentWriteRepository commentWriteRepository, ICommentReadRepository readRepository, IUnitOfWork unitOfWork, IMapper mapper, IAccessTokenReader accessTokenReader, CommentCreatorDomainService commentCreator, NotificationCreatorDomainService notificationCreator, ITransactionCreator transactionCreator, INotificationWriteRepository notificationRepository) : IRequestHandler<CreateCommentDto, CommentResponseDto>
    {
        private readonly IAccessTokenReader _accessTokenReader = accessTokenReader;
        private readonly IMapper _mapper = mapper;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly ITransactionCreator _transactionCreator = transactionCreator;

        private readonly NotificationCreatorDomainService _notificationCreator = notificationCreator;
        private readonly INotificationWriteRepository _notificationRepository = notificationRepository;

        private readonly ICommentWriteRepository _commentWriteRepository = commentWriteRepository;
        private readonly CommentCreatorDomainService _commentCreator = commentCreator;
        private readonly ICommentReadRepository _commentReadRepository = readRepository;
        
        

        public async Task<CommentResponseDto> Handle(CreateCommentDto request, CancellationToken cancellationToken)
        {
            var userId = _accessTokenReader.GetRequiredAccountId();

            var transaction = await _transactionCreator.CreateTransactionAsync(cancellationToken);

            var content = new Content(request.Content);
            var comment = new Comment();
            await _commentCreator.CreateAsync(comment, userId, content, request.QuestionId, request.SolutionId, request.ParentId, cancellationToken);
            await _commentWriteRepository.CreateAsync(comment, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            var notification = new Notification();
            await _notificationCreator.CreateCommentCreatedNotificationAsync(notification,comment,cancellationToken);
            await _notificationRepository.CreateAsync(notification, cancellationToken);
            await _unitOfWork.CommitAsync(cancellationToken);

            await transaction.CommitAsync(cancellationToken);

            return _mapper.Map<CommentResponseDto>(
                await _commentReadRepository.GetByIdAsync(comment.Id, cancellationToken)
            );
        }
    }
}
