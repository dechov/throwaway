module.exports = (grunt) ->
  LIVERELOAD_PORT = 35734
  require("load-grunt-tasks")(grunt)

  grunt.initConfig
    watch:
      options:
        livereload: LIVERELOAD_PORT
        spawn: false
      index:
        files: "app/index.html"
        tasks: ["copy:index"]
      scripts:
        files: "app/scripts/**/*.coffee"
        tasks: ["copy:source", "coffee"]
      styles:
        files: "app/styles/**/*.scss"
        tasks: ["sass", "autoprefixer"]
      data:
        files: "data/**/*"
        tasks: ["copy:data"]
      vendor:
        files: "vendor"
        tasks: ["copy:vendor"]

    clean:
      build: ".tmp"

    connect:
      livereload:
        options:
          port: 8000
          base: ".tmp"
          livereload: LIVERELOAD_PORT
          useAvailablePort: true

    coffee:
      build:
        options:
          sourceMap: true
        files: [
          expand: true
          cwd: "app/scripts"
          src: "**/*.coffee"
          dest: ".tmp"
          ext: ".js"
        ]

    copy:
      index:
        expand: true
        src: "app/index.html"
        dest: ".tmp/"
        flatten: true
      source:
        src: "app/scripts/**"
        dest: ".tmp/"
      data:
        src: "data/**"
        dest: ".tmp/"
      vendor:
        expand: true
        cwd: "vendor/"
        dest: ".tmp/vendor"
        src: [
          "requirejs/require.js"
          "modernizr/modernizr.js"
        ]

    sass:
      build:
        src: "app/styles/main.scss"
        dest: ".tmp/main.css"

    autoprefixer:
      options:
        browsers: ["> 1%"]
      build:
        src: ".tmp/main.css",
        dest: ".tmp/main.css"


  grunt.registerTask "default", [
    "clean"
    "copy:vendor"
    "copy:data"
    "copy:index"
    "copy:source"
    "sass:build"
    "autoprefixer:build"
    "coffee:build"
    "connect:livereload"
    "watch"
  ]
