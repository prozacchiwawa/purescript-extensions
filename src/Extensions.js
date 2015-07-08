/* global exports */

// module Extensions


    "use strict";

    function fail(s) {
      throw new Error(s);
    }

    function undef() {
        throw new Error("Encountered undefined");
    }

    function unsafeTrace(s) {
        return function (r) {
            console.log(s);
            return (r);
        };
    }

    function unsafeCoerce(x) {
         return x;
    }

    function mapE(f) {
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
