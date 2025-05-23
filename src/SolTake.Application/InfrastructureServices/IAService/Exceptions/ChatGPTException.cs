using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Application.InfrastructureServices.IAService.Exceptions
{
    public class ChatGPTException(string message) : AppException((int)HttpStatusCode.BadRequest, message)
    {
        public override string GetErrorMessage(string culture) => Message;
    }
}
