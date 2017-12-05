/* global exports */

// module Extensions


    "use strict";

    exports.fail = function(s) {
      throw new Error(s);
    }

    exports.undef = function() {
        throw new Error("Encountered undefined");
    }

    exports.unsafeCoerce = function(x) {
         return x;
    }

    exports.mapE = function(f) {
      return function(arr) {
        return function() {
          var res = new Array(arr.length);
          for (var i = 0; i < arr.length; i++) {
            res[i] = f(arr[i])();
          }
          return res;
        };
      };
   }

   exports.mapE_ = function(f) {
     return function(arr) {
       return function() {
         for (var i = 0; i < arr.length; i++) {
           f(arr[i])();
         }
       };
     };
  }

   exports.mapEBreak = function(f) {
       return function(b) {
       return function(arr) {
       return function() {
         var res = new Array(arr.length);
         for (var i = 0; i < arr.length; i++) {
           res[i] = f(arr[i])();
           var shouldBreak = b(i)();
           if (shouldBreak) {
               res = res.slice(0,i);
                break;
            };
        };
         return res;
       };
     };
   };
 };

  exports.mapEBreak_ = function(f) {
      return function(b) {
      return function(arr) {
      return function() {
        for (var i = 0; i < arr.length; i++) {
          f(arr[i])();
          var shouldBreak = b(i)();
          if (shouldBreak) {
               break;
           };
        };
      };
    };
  };
}

exports.replicate = function (n) {
  return function (v) {
    if (n < 1) return [];
    var r = new Array(n);
    for (var i = 0; i < n; i++) r[i] = v;
    return r;
  };
};

exports.timeout = function(millis) {
    return function(action) {
        return function() {
            setTimeout(action, millis);
        };
    };
}

exports.alert = function(msg) {
    return function() {
        window.alert(msg);
        return {};
    };
}

exports.logAny = function(level) {
    return function(text) {
        return function(k) {
            var logLevelString = level.constructor.name;
            console.log(logLevelString, ": ", text);
            if (log4js == null) {
                console.log(logLevelString, ": ", text);
            } else {
                if (logLevelString == "Trace"){
                    log4js.trace(text);
                } else if (logLevelString == "Debug"){
                    log4js.debug(text);
                } else if (logLevelString == "Info"){
                    log4js.info(text);
                } else if (logLevelString == "Warn"){
                    log4js.warn(text);
                } else if (logLevelString == "Error"){
                    log4js.error(text);
                } else if (logLevelString == "Fatal"){
                    log4js.fatal(text);
              }
          }
          return k({});
      }
    }
};

exports.parseDate = function (dateString) {
    return new Date(dateString);
};

exports.toISOString = function (date) {
    return date.toISOString();
};

exports.stringify = function(x) {
    return JSON.stringify(x);
};
