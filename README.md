# GDLayerKit
Group of classes designed for easy integrating MVVM support into your application without using complex reactive frameworks.

# TODO
- Add UIScrollView to each view controller.
- Move all actions to separated method inside controllers and components. It should contain both actions and KVO binding.
- Remove target and selector from LKUIFabric.
- Transform HUD to global view (add it to UIWindow).
- Add "retain count" for HUD to detect its users count. When users = 0 - hide automatically.
