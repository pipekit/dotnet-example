FROM mcr.microsoft.com/dotnet/sdk:8.0
WORKDIR /App
COPY . ./
RUN dotnet publish -c Release -o out
