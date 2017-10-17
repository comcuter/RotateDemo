这个工程主要目的是:

1. 在除 master 外的几个分支上展示了从一个 Portrait 的 ViewController 切换到一个 LandScape 的ViewController 的几种方式. 但是这几种方式的切换动画都很难看.只有 transform 方式有改进的可能性,其他则只是作为退而求其次的方法.
2. master 分支上展示了 Potrait 和 Landscape orientation 下展示两个不同的 view 的几种方法.

### master  
这个分支上主要展示 Potrait 和 LandScape orientation 下展示两个不同的 view 的几种方法.

### setRootViewController
通过设置 window.rootViewController 的方式.在 push LandScape 的 Viewcontroller 时,将其设置为 rootViewController 这样系统会根据第二个 viewController 所支持的 orientation (ios5, 6中写法不同)来进行调整.

支持 ios4,5,6.

### showAndHideModalView
在 LandScape 的 viewController 的 viewWillAppear 方法中, show and then hide a modal viewController. 这种方式也会引起系统根据第二个ViewController 支持的 orientation 来进行调整.

支持 ios4,5,6.

### transform
这种方式也是最好用,也最不算 Trick 的一种方式.先设置 statusBar 的 orientation,然后再对 view 加一个 transform. 并且经过优化后,动画效果也会很不错,但是这种方式需要注意的是 supportedInterfaceOrientations 需要返回 0,setStatusBarOrientation 才能起作用.

支持 ios4,5,6.