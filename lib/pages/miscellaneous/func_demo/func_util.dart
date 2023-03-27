//节流是在事件触发时，立即执行事件的目标操作逻辑，
//在当前事件未执行完成时，该事件再次触发时会被忽略，直到当前事件执行完成后下一次事件触发才会被执行。
//使用场景: 多用于按钮点击事件的限制，如数据提交等，可有效防止数据的重复提交

// 防抖是在事件触发时，不立即执行事件的目标操作逻辑，而是延迟指定时间再执行，
// 如果该时间内事件再次触发，则取消上一次事件的执行并重新计算延迟时间，直到指定时间内事件没有再次触发时才执行事件的目标操作。
//使用场景: 多用于事件频繁触发的场景，如滚动监听、输入框输入监听等


import 'dart:async';
import 'package:flutter/material.dart';



extension FunctionExt on Function{
  VoidCallback throttle(){
    return FunctionProxy(this).throttle;
  }

  VoidCallback throttleWithTimeout({int? timeout}){
    return FunctionProxy(this, timeout: timeout).throttleWithTimeout;
  }

  VoidCallback debounce({int? timeout}){
    return FunctionProxy(this, timeout: timeout).debounce;
  }
}

class FunctionProxy {
  static final Map<String, bool> _funcThrottle = {};
  static final Map<String, Timer> _funcDebounce = {};
  final Function? target;

  final int timeout;

  FunctionProxy(this.target, {int? timeout}) : timeout = timeout ?? 500;

  void throttle() async {
    String key = hashCode.toString();
    bool enable = _funcThrottle[key] ?? true;
    if (enable) {
      _funcThrottle[key] = false;
      try {
        await target?.call();
      } catch (e) {
        rethrow;
      } finally {
        _funcThrottle.remove(key);
      }
    }
  }

  void throttleWithTimeout() {
    String key = hashCode.toString();
    bool enable = _funcThrottle[key] ?? true;
    if (enable) {
      _funcThrottle[key] = false;
      Timer(Duration(milliseconds: timeout), () {
        _funcThrottle.remove(key);
      });
      target?.call();
    }
  }

  void debounce() {
    String key = hashCode.toString();
    Timer? timer = _funcDebounce[key];
    timer?.cancel();
    timer = Timer(Duration(milliseconds: timeout), () {
      Timer? t = _funcDebounce.remove(key);
      t?.cancel();
      target?.call();
    });
    _funcDebounce[key] = timer;
  }
}