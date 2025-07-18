﻿using SolTake.Core;
using SolTake.Core.Exceptions;
using System.Net;

namespace SolTake.Domain.BalanceAggregate.Exceptions
{
    public class CurrencyMismatchException : AppException
    {
        private readonly static string _messageEn = "Currency mismatch!";
        private readonly static string _messageTr = "Para birimi uyuşmuyor!";
        private readonly static Dictionary<string, string> _messages = new() {
            { Languages.EN, _messageEn },
            { Languages.TR, _messageTr }
        };

        public override string GetErrorMessage(string culture) => _messages[culture];
        public CurrencyMismatchException() : base((int)HttpStatusCode.BadRequest) { }
    }
}
