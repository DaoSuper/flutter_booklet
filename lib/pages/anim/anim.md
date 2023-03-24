动画的实现是 数值变化 + 绘制刷新

#### 动画体系, 三个比较重要的类
1、Curve(动画曲线)
2、Animation<T>(动画器)
3、Animatable<T>(转换器)

#### Animation源码
特点是可以进行 监听/注销 以及获取 value 的能力。其自身定义了通用的动画属性信息及 drive 方法

装饰者模式：通过其他对象的搭配，完成功能扩展的模式

#### Animatable源码
在 Animatable 源码中，无论是 evaluate 方法还是 animate 和 chain 方法 ，其逻辑都是通过抽象方法 transform 实现的。
将 double 类型数值 转化为 指定类型 T
适配器模式：让两个无法兼容的接口通过 适配器 的 转换 而可以兼容。

#### Curve
将 double 数值转换成 double 数值
实现 transformInternal 方法，对 t 进行转换


#### 三个类关系

- 动画器与转换器 间的关系
1. 转换器通过动画器生成新的动画器: animate 方法
   colorAnimation = colorAnimatable.animate(_ctrl);

2. 转换器通过动画器生成 T 对象: evaluate 方法
   colorAnimatable.evaluate(_ctrl)

3. 动画器通过转换器生成新的动画器: drive 方法
   colorAnimation = _ctrl.drive(colorAnimatable);

- 动画器与动画曲线 间的关系
1. 动画器和动画曲线建立联系: CurveAnimation
   // 通过 [控制器] 和 Curves.ease 曲线, 为 easeAnimation 赋值
   easeAnimation = CurvedAnimation(parent: _ctrl, curve: Curves.ease);

2. 动画曲线直接变换动画器值: transform 方法
   // 直接通过 [曲线动画] 变换 [动画器]
   Curves.ease.transform(_ctrl.value);

- 转换器与动画曲线 间的关系
  两者之间只能通过 CurveTween 建立联系
  // 创建具有 [ease] 变化曲线的 [转换器]
  Animatable<double> easeAnimatable = CurveTween(curve: Curves.ease);