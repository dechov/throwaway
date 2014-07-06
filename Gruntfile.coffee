module.exports = (grunt) ->
  require('load-grunt-tasks')(grunt)

  grunt.initConfig
    watch:
      options:
        livereload: true
        spawn: false
      index:
        files: 'app/index.html'
        tasks: ['copy:index']
      scripts:
        files: 'app/scripts/**/*.coffee'
        tasks: ['coffee']
      styles:
        files: 'app/styles/**/*.scss'
        tasks: ['sass', 'autoprefixer']

    clean:
      build: '.tmp'

    connect:
      livereload:
        options:
          port: 9000
          base: '.tmp'
          livereload: true

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
        src: 'app/index.html'
        dest: '.tmp/'
        flatten: true
      vendor:
        src: 'vendor/**/*.{js,css}'
        dest: '.tmp/'
      data:
        src: 'data/*'
        dest: '.tmp/'

    sass:
      build:
        src: "app/styles/main.scss"
        dest: ".tmp/main.css"

    autoprefixer:
      options:
        browsers: ['> 1%']
      build:
        src: '.tmp/main.css',
        dest: '.tmp/main.css'


  grunt.registerTask 'default', [
    'clean'
    'copy:vendor'
    'copy:data'
    'copy:index'
    'sass:build'
    'autoprefixer:build'
    'coffee:build'
    'connect:livereload'
    'watch'
  ]
