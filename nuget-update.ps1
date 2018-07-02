copy src\TypeGen\TypeGen.Cli\bin\Release\PublishOutput\TypeGen.Cli.dll nuget\lib\netcoreapp2.0\dotnet-typegen.dll
copy src\TypeGen\TypeGen.Cli\bin\Release\PublishOutput\TypeGen.Cli.runtimeconfig.json nuget\lib\netcoreapp2.0\dotnet-typegen.runtimeconfig.json

nuget pack nuget\TypeGen.DotNetCli.nuspec
move TypeGen.DotNetCli.1.6.4.nupkg nuget -force

if (Test-Path "local-nuget-path.txt") {
  $localNuGetPath = Get-Content "local-nuget-path.txt"
  copy nuget\TypeGen.DotNetCli.1.6.4.nupkg $localNuGetPath
}
