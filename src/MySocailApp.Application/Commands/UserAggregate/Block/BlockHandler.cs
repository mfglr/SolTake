using AutoMapper;
using MediatR;
using MySocailApp.Application.InfrastructureServices;
using MySocailApp.Domain.UserDomain.UserAggregate.Abstracts;
using MySocailApp.Domain.UserDomain.UserAggregate.Exceptions;

namespace MySocailApp.Application.Commands.UserAggregate.Block
{
    public class BlockHandler(IUserAccessor userAccessor, IUnitOfWork unitOfWork, IMapper mapper, IUserWriteRepository userWriteRepository) : IRequestHandler<BlockDto, BlockCommandResponseDto>
    {
        private readonly IUserAccessor _userAccessor = userAccessor;
        private readonly IUserWriteRepository _userWriteRepository = userWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private readonly IMapper _mapper = mapper;

        public async Task<BlockCommandResponseDto> Handle(BlockDto request, CancellationToken cancellationToken)
        {
            var blocked =
                await _userWriteRepository.GetByIdAsync(request.BlockedId, cancellationToken) ??
                throw new UserNotFoundException();
            var block = blocked.Block(_userAccessor.User.Id);

            await _unitOfWork.CommitAsync(cancellationToken);
            return _mapper.Map<BlockCommandResponseDto>(block);
        }
    }
}
