﻿using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.UserAggregate.Exceptions
{
    public class UserHasBalanceException : AppException
    {
        private readonly static string _messageEn = "You have a balance in your account!";
        private readonly static string _messageTr = "Hesabınızda bakiye var!";
        private readonly static Dictionary<string, string> _messages = new()
        {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];
        public UserHasBalanceException() : base((int)HttpStatusCode.BadRequest) { }
    }
}
