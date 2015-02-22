module.exports = function(grunt) {

  "use strict";

  grunt.initConfig({

    libFiles: [
      "src/**/*.purs",
      "bower_components/**/src/**/*.purs"
    ],
    testFiles: [
      "tests/**/*.purs"
    ],

    clean: ["tmp", "output"],

    watch: {
      purs: {
        files: [
            "<%=libFiles%>",
            "<%=testFiles%>"
        ],
        tasks: [
          "make"
        ]
      },
    },

    pscMake: {
      lib: {
        src: ["<%=libFiles%>"]
      }
    },

    psc: {
        options: {
            main: false,
            modules: ["Extensions"]
        },
      all: {
        src: ["<%=libFiles%>"],
        dest: "dist/Main.js"
      },
      tests: {
        dest: "dist/Test.js",
        src: ["tests/MainTest.purs", "<%=libFiles%>", "<%=testFiles%>"]
      }
    },

    dotPsci: ["<%=libFiles%>"],

    pscDocs: {
      readme: {
        src: "<%=libFiles%>",
        dest: "docs/Module.md"
      }
    },

    copy: [
      {
        expand: true,
        cwd: "output",
        src: ["**"],
        dest: "tmp/node_modules/"
      },
      {
        src: ["dist/Test.js"],
        dest: "tmp/Test.js"
      }
    ],

    execute: {
      tests: {
        src: "tmp/Test.js"
      }
    }

  });

  grunt.loadNpmTasks("grunt-contrib-copy");
  grunt.loadNpmTasks("grunt-contrib-clean");
  grunt.loadNpmTasks("grunt-purescript");
  grunt.loadNpmTasks("grunt-execute")
  grunt.loadNpmTasks("grunt-contrib-watch");

  grunt.registerTask("test", ["psc:tests", "copy", "execute:tests"]);
  grunt.registerTask("default", ["psc:all", "dotPsci", "pscDocs"]);
  grunt.registerTask("make", ["pscMake:lib", "dotPsci", "pscDocs"]);
};
