﻿using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.SolutionUserSaveAggregate.Exceptions
{
    public class UserBlockedException : AppException
    {
        private readonly static string _messageEn = "Cannot save the solution of this user because you are blocked.";
        private readonly static string _messageTr = "Kullanıcıyı engellediğin için bu çözümü kaydedemezsin.";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public UserBlockedException() : base((int)HttpStatusCode.BadRequest) { }
    }
}
