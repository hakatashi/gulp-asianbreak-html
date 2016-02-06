require! {livescript, gulp, \gulp-livescript, \gulp-mocha}

gulp.task \build ->
  gulp.src \index.ls
  .pipe gulp-livescript!
  .pipe gulp.dest \.

gulp.task \test [\build] ->
  gulp.src \test/test.ls read: false
  .pipe gulp-mocha reporter: \spec

gulp.task \default [\test]
