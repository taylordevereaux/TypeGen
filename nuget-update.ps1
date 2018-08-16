copy src\TypeGen\TypeGen.Cli\bin\Release\netcoreapp2.0\publish\TypeGen.Cli.dll nuget\lib\netcoreapp2.0\dotnet-typegen.dll
copy src\TypeGen\TypeGen.Cli\bin\Release\netcoreapp2.0\publish\TypeGen.Cli.runtimeconfig.json nuget\lib\netcoreapp2.0\dotnet-typegen.runtimeconfig.json

nuget pack nuget\TypeGen.DotNetCli.nuspec
move TypeGen.DotNetCli.1.6.5.nupkg nuget -force

if (Test-Path "local-nuget-path.txt") {
  $localNuGetPath = Get-Content "local-nuget-path.txt"
  copy nuget\TypeGen.DotNetCli.1.6.5.nupkg $localNuGetPath
}
