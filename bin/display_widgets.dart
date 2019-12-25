import 'dart:io';
import 'package:args/args.dart';

/// The command line interface for scanning, building and starting the showcase applicaiton
void main(List<String> arguments) async {

  final parser = ArgParser()
    ..addOption("platform", abbr: 'p', defaultsTo: "desktop");

  var argResults = parser.parse(arguments);
  var platformArg = argResults["platform"];


  var platform = platformArg;
  if(platformArg == "desktop") {
    if(Platform.isWindows) {
      platform = "windows";
    } else if(Platform.isMacOS) {
      platform = "macos";
    } else if(Platform.isLinux) {
      platform = "linux";
    }
  }


  var projectPath = Uri.base.toFilePath(windows: Platform.isWindows);

  var buildScript = Platform.script.resolve("..").resolve("build.categorizer.yaml");
  File thisBuildScript = File(buildScript.toFilePath(windows: Platform.isWindows));
  await thisBuildScript.copy("${projectPath}build.categorizer.yaml");


  print("Moving main ...");
  // Copy the main into the project

  var main = Platform.script.resolve("..").resolve("lib/main.dart");
  File thisMain = File(main.toFilePath(windows: Platform.isWindows));
  await thisMain.copy("${projectPath}lib/\$categorizer_main.dart");


  print("Generating reflection ...");
  //TODO abstract these shell calls
  // TODO call pub get in other project before runnning builder
  var res = await Process.start(
      "flutter pub run build_runner build lib -ccategorizer",
      [],
      //workingDirectory: "C://Users//Norbert//workspace//design_120fps",
      runInShell: true,
  );
  stdout.addStream(res.stdout);
  stderr.addStream(res.stderr);

  await res.exitCode;


  print("Running it ...");
  var flutterRes = await Process.start(
    "flutter run -d $platform -tlib/\$categorizer_main.dart",
    [],
    // TODO take this from command line
    //workingDirectory: "C://Users//Norbert//workspace//design_120fps",
    runInShell: true,
  );
  stdout.addStream(flutterRes.stdout);
  stderr.addStream(flutterRes.stderr);

  await flutterRes.exitCode;

}