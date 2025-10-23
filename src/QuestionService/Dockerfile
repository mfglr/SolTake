from mcr.microsoft.com/dotnet/sdk:9.0 as build
workdir /app
expose 80
copy src/SolTake.Core/*.csproj src/SolTake.Core
copy src/SolTake.QuestionService.Domain/*.csproj src/SolTake.QuestionService.Domain/
copy src/SolTake.QuestionService.Application/*.csproj src/SolTake.QuestionService.Application/
copy src/SolTake.QuestionService.Infrastructure/*.csproj src/SolTake.QuestionService.Infrastructure/
copy src/SolTake.QuestionService.Api/*.csproj src/SolTake.QuestionService.Api/
run dotnet restore src/SolTake.QuestionService.Api/*.csproj
copy . .
run dotnet publish src/SolTake.QuestionService.Api/*.csproj -c Release -o out
from mcr.microsoft.com/dotnet/aspnet:9.0 as runtime
workdir /app
copy --from=build /app/out .
entrypoint ['dotnet', 'SolTake.QuestionService.Api.dll']