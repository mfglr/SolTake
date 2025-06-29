﻿using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.UserAggregate.Exceptions
{
    public class InvalidUserNameException : AppException
    {
        private readonly static string _messageEn = "Username is invalid!";
        private readonly static string _messageTr = "Kullanıcı adı geçerli değil!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };
        public override string GetErrorMessage(string culture) => _messages[culture];

        public InvalidUserNameException() : base((int)HttpStatusCode.BadRequest) { }
    }
}
