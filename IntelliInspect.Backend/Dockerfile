# Use .NET 8 for better stability and latest features
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
WORKDIR /app
EXPOSE 5000
ENV ASPNETCORE_URLS=http://+:5000

# Build stage
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy project file and restore dependencies
COPY ["IntelliInspect.Backend.csproj", "./"]
RUN dotnet restore "IntelliInspect.Backend.csproj"

# Copy the rest of the code
COPY . .

# Build and publish the application
RUN dotnet publish "IntelliInspect.Backend.csproj" -c Release -o /app/publish /p:UseAppHost=false

# Final stage
FROM base AS final
WORKDIR /app

# Create Storage directory with proper permissions
RUN mkdir -p /app/Storage && chmod 755 /app/Storage

# Copy published application
COPY --from=build /app/publish .

ENTRYPOINT ["dotnet", "IntelliInspect.Backend.dll"]