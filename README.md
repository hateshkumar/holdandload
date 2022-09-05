

## Flutter version 3.1.0

## Description

The idea of this package is to create holding animated buttons like Snapchat and Instagram shows while recording reels or stories.

## Getting started

Wrap HoldAndLoad Widget with Scaffold

```dart
 HoldAndLoad(
            child:Text('hold'),
            controller: ShootingController(ShootingValue(false, false)),
            isShootingButtonAnimate: false,
            style: HoldNLoadStyle,
            callBackShootingEnd: callBackEnd,
            callBackShootingStart: callBackStart,
            listener:listener,
           );
```

## HoldAndLoad Style

Style can be with gradient or background

 ```dart

with gradient

Style.withGradientColor(
outerSize: const Size.square(115),
innerSize: const Size.square(82),
outerColor: Colors.white,
progressColor: Colors.redAccent,
gradient: const LinearGradient(
begin: Alignment.centerLeft,
end: Alignment.centerRight,
colors: [
Color(0xFF00AACE),
Color(0xFF006BCE),
],
),
progressWidth: 3,
outerWidth: 4)

```

 ```dart

with background

Style.withBackgroundColor(
                       outerSize: const Size.square(115),
                       innerSize: const Size.square(82),
                       outerColor: Colors.white,
                       progressColor: Colors.redAccent,
                       backgroundColor: const Color(0xFF00AACE),
                       progressWidth: 3,
                       outerWidth: 4
                       )

```

## CallBack

# callBackShootingStart:
callBackShootingStart will get triggered as soon as the HoldAndLoad longPress gesture detcted, it will only triggered one time.


# callBackShootingEnd:
callBackShootingEnd will get triggered as soon as the HoldAndLoad longPress released, it will only triggered one time.

# listener:
listener will get triggered from the start of callBackShootingStart till callBackShootingEnd triggered.

## DEMO

https://user-images.githubusercontent.com/18635520/188497437-f1638f3a-60a2-408c-bdb8-1b9b363f3963.mp4


![1](https://user-images.githubusercontent.com/18635520/188443192-b154b0b1-2e1c-451b-ba3d-70b5386ba120.png)
![2](https://user-images.githubusercontent.com/18635520/188443197-0f39508e-354a-4c1e-9e55-86eaf6ad78f4.png)
![3](https://user-images.githubusercontent.com/18635520/188443200-262bb2ed-3105-40e6-98f7-144a2a54881a.png)


