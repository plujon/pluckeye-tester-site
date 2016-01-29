function ostype() {
  if (navigator.userAgent.match('Mobile'))
    return "mobile";
  return "traditional";
}

var _osfamily;
function osfamily() {
  if (typeof _osfamily !== 'undefined')
    return _osfamily;
  function get() {
    switch (ostype()) {
    case "mobile":
      // Look for windowsphone first because its user agent string
      // includes "Android" and "iPhone".
      if (navigator.userAgent.match('Windows Phone')) return 'windowsphone';
      if (navigator.userAgent.match('iPhone')) return 'ios';
      if (navigator.userAgent.match('iPad')) return 'ios';
      if (navigator.userAgent.match('Android')) return 'android';
    case "traditional":
      if (navigator.userAgent.match('Linux')) return 'linux';
      if (navigator.userAgent.match('Mac OS X')) return 'macosx';
      if (navigator.userAgent.match('Windows')) return 'windows';
    }
  }
  _osfamily = get();
  return _osfamily;
}

var _osfamilies;
function osfamilies() {
  if (typeof _osfamilies === 'undefined')
    _osfamilies = { android: true,
                    ios: true,
                    linux: true,
                    macosx: true,
                    windows: true };
  return _osfamilies;
}

// TODO: Use a javascript utility library for this
var _osfamiliesAsArray;
function osfamiliesAsArray() {
  if (typeof _osfamiliesAsArray === 'undefined') {
    _osfamiliesAsArray = [];
    var obj = osfamilies();
    for (var key in obj) {
      if (obj.hasOwnProperty(key)) {
        _osfamiliesAsArray.push(key);
      }
    }
  }
  return _osfamiliesAsArray;
}

function osversion() {
  var match;
  switch (osfamily()) {
  case "android":
    match = navigator.userAgent.match(/Android ([\d.]+)/);
    break;
  case "ios": break;
  case "linux": break;
  case "macosx":
    match = navigator.userAgent.match(/Mac OS X ([\d.]+)/);
    break;
  case "windows":
    match = navigator.userAgent.match(/Windows NT ([\d.]+)/);
    break;
  case "windowsphone":
    match = navigator.userAgent.match(/Windows Phone ([\d.]+)/);
    break;
  }
  if (match) {
    return osfamily() + "-" + match[1];
  }
  return osfamily();
}

function osversion_friendly() {
  switch (osversion()) {
  case "windows-5.0": return "windows 2000";
  case "windows-5.1": return "windows xp";
  case "windows-5.2": return "windows xp";
  case "windows-6.0": return "windows vista";
  case "windows-6.1": return "windows 7";
  case "windows-6.2": return "windows 8";
  case "windows-6.3": return "windows 8.1";
  case "windows-10.0": return "windows 10";
  case "macosx": return "macosx";
  case "linux": return "linux";
  }
  return osversion();
}

function osversion_pretty() {
  switch (osversion()) {
  case "windows-5.0": return "Windows 2000";
  case "windows-5.1": return "Windows XP";
  case "windows-5.2": return "Windows XP";
  case "windows-6.0": return "Windows vista";
  case "windows-6.1": return "Windows 7";
  case "windows-6.2": return "Windows 8";
  case "windows-6.3": return "Windows 8.1";
  case "windows-10.0": return "Windows 10";
  case "macosx": return "Mac OS X";
  case "linux": return "Linux";
  }
  return osversion();
}

function oscpu() {
  var s = navigator.oscpu || navigator.userAgent;
  if (s.match(/ARM/)) return "arm";
  if (s.match(/x86_64/)) return "x86_64";
  if (s.match(/x64/)) return "x86_64";
  if (s.match(/WOW64/)) return "x86_64";
  if (s.match(/i686/)) return "i686";
  if (navigator.platform == "Win64") return "x86_64";
  if (navigator.platform == "Win32") return "i686";
  return "";
}

function oscpu_friendly() {
  switch (oscpu()) {
  case "x86_64": return "(64-bit)";
  case "i686": return "(32-bit)";
  case "arm": return "(ARM)";
  default: return oscpu();
  }
}

function osvx() {
  return [osversion(), oscpu()].join("--");
}

function osvx_friendly() {
  return [osversion_friendly(), oscpu_friendly()].join(" ");
}

function extension(osf) {
  if (typeof(osf) === 'undefined')
    osf = osfamily();
  switch (osf) {
  case "windows": return ".exe";
  default: return ".tar.gz";
  }
}
