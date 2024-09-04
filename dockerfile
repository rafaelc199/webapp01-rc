# Use the .NET SDK image to build and run the app
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build

WORKDIR /app
#copy everthing
COPY . ./

RUN dotnet restore
RUN dotnet publish -c Release -o /app/out

FROM mcr.microsoft.com/dotnet/aspnet
WORKDIR /app/release

ENTRYPOINT ["dotnet", "webapp01.dll"]

EXPOSE 8080

