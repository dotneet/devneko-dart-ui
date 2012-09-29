library dn_ui;

import 'dart:html';
import 'common.dart';

class VirtualWindowManager {
  var _windows = new List<WindowBase>();
  Element _parent;
  VirtualWindowManager([this._parent]) {
    if ( this._parent == null ) {
      _parent = document.body;
    }
  }
  void addWindow(WindowBase window) {
    _parent.insertAdjacentElement("beforeEnd", window._elem);
    _windows.add(window);
  }
  void render(CanvasRenderingContext2D ctx) {
    _windows.sort((l,r) => l.z - r.z);
    _windows.forEach((window){
      if ( window.visible ) {
        window.update();
      }
    });
  }
}

class WindowBase {
  Element _elem;
  UiLocation _location = new UiLocation(0,0,0);
  Size _size = new Size(0,0);
  
  void update() {}
  
  ElementEvents get on() => _elem.on;
  CSSStyleDeclaration get style() => _elem.style;
  
  int get x => _location.x;
  void set x(num newX) {
    this._elem.style.left = "${newX}px";
    _location.x = newX;
  }
  int get y => _location.y;
  void set y(num newY) {
    this._elem.style.top = "${newY}px";
    _location.y = newY;
  }
  int get z => _location.z;
  void set z(num newZ) {
    this._elem.style.zIndex = newZ;
    _location.z = newZ;
  }
  
  int get width => _size.width;
  int get height => _size.height;
  void set width(int w) {
    _elem.style.width = "${w}px";
    _size.width = w;
  }
  void set height(int h) {
    _elem.style.height = "${h}px";
    _size.height = h;
  }
  
  bool _visible = true;
  bool get visible() => _visible;
  void set visible(bool v) {
    if ( v ) {
      _elem.style.display = "inline-block";
    } else {
      _elem.style.display = "none";
    }
    _visible = v;
  }
  
}

class CanvasWindow extends WindowBase {
  CanvasElement _canvas;
  CanvasRenderingContext2D _context;
  CanvasWindow([this._canvas]) {
    if ( _canvas == null ) {
      _canvas = new CanvasElement();
      _canvas.style.position = "absolute";
    }
    this._elem = _canvas;
    this._context = _canvas.getContext("2d");
  }
  
  CanvasRenderingContext2D get context() => _context;
}

class VirtualWindow extends WindowBase {
  VirtualWindow() {
    this._elem = new DivElement();
  }
  
  void addElement(Element elm) {
    _elem.insertAdjacentElement( "beforeEnd", elm );
  }
}

