using AccountDomain.AccountAggregate.Abstracts;
using AccountDomain.AccountAggregate.Exceptions;
using AutoMapper;
using MediatR;
using MySocailApp.Application.InfrastructureServices;

namespace MySocailApp.Application.Commands.UserAggregate.Block
{
    public class BlockHandler(IAccountAccessor accountAccessor, IUnitOfWork unitOfWork, IMapper mapper, IAccountWriteRepository accountWriteRepository) : IRequestHandler<BlockDto, BlockCommandResponseDto>
    {
        private readonly IAccountAccessor _accountAccessor = accountAccessor;
        private readonly IAccountWriteRepository _accountWriteRepository = accountWriteRepository;
        private readonly IUnitOfWork _unitOfWork = unitOfWork;
        private IMapper _mapper = mapper;

        public async Task<BlockCommandResponseDto> Handle(BlockDto request, CancellationToken cancellationToken)
        {
            var blocked =
                await _accountWriteRepository.GetAccountAsync(request.BlockedId, cancellationToken) ??
                throw new AccountNotFoundException();
            var block = blocked.Block(_accountAccessor.Account.Id);

            await _unitOfWork.CommitAsync(cancellationToken);
            return _mapper.Map<BlockCommandResponseDto>(block);
        }
    }
}
