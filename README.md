# flutter_organized_widgets

Display all stand alone widgets in a nice UI



![Video](https://github.com/Norbert515/flutter_organized_widgets/blob/master/github_assets/gallery.gif)

## How to install


Add to dependencies:

```
  flutter_organized_widgets:
    git: https://github.com/Norbert515/flutter_organized_widgets.git
```


add to dev_dependencies:

```
  build_runner: [appropriate build_runner version]
```


Because of the migration to NNDT build_runner might cause trouble depending on your flutter channel/version. You might have to fork and change the build_runner versions.


## Annotate widgets

For every widget you'd like to have included in the overview, add the @reflector annotation

``` dart
@reflector
class FancyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.indigo,
    );
  }
}

```

if the widget needs parameters:

``` dart
@reflector
@Defaults(
  [],
  positioned: {
    'imageProvider': NetworkImage(
        "https://images.unsplash.com/photo-1546072533-675fd58d08e8?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1000&q=80"),
    'text': "This is a nice video",
    "width": 300.0,
    "height": 150.0,
    "elevation": 8.0,
    'fit': BoxFit.cover,
  }

)
class VideoCard extends StatelessWidget {

...

}
```

## Run the gallery 

Run :
```
flutter pub run flutter_organized_widgets:display_widgets 
```


you may pass
```
-p: [windows|linux|macos] (platform)
-f [path-to-flutter/bin/flutter]) (if you are using separate flutter installation
```



