rm -Recurse -Force nuget\tools\netcoreapp2.1\any\runtimes
copy -Recurse src\TypeGen\TypeGen.Cli\bin\Release\netcoreapp2.1\publish\* nuget\tools\netcoreapp2.1\any

nuget pack nuget\TypeGen.DotNetCli.nuspec
move TypeGen.DotNetCli.2.0.0.nupkg nuget -force

if (Test-Path "local-nuget-path.txt") {
  $localNuGetPath = Get-Content "local-nuget-path.txt"
  copy nuget\TypeGen.DotNetCli.2.0.0.nupkg $localNuGetPath
}
