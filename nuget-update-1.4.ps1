copy src\TypeGen\TypeGen.Cli\bin\Release\TypeGen.Cli.exe nuget\tools\TypeGen.exe
copy src\TypeGen\TypeGen.Cli\bin\Release\TypeGen.Cli.exe.config nuget\tools\TypeGen.exe.config
copy src\TypeGen\TypeGen.Core\bin\Release\TypeGen.Core.dll nuget\tools

copy src\TypeGen\TypeGen.Core\bin\Release\TypeGen.Core.dll nuget\lib\net40
copy src\TypeGen\TypeGen.Core\bin\Release\TypeGen.Core.xml nuget\lib\net40

nuget pack nuget\TypeGen.nuspec
move TypeGen.1.4.2.nupkg nuget -force

copy nuget\TypeGen.1.4.2.nupkg D:\OneDrive\D\Projects\custom-nuget
