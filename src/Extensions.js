/* global exports */

// module Extensions


    "use strict";

    exports.fail = function(s) {
      throw new Error(s);
    }

    exports.undef = function() {
        throw new Error("Encountered undefined");
    }

    exports.unsafeTrace = function(s) {
        return function (r) {
            console.log(s);
            return r;
        };
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

    exports.timeout = function(millis) {
        return function(action) {
            return function() {
                setTimeout(action, millis);
            };
        };
    }
