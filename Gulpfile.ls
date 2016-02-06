require! {gulp, \gulp-livescript}

gulp.task \build ->
  gulp.src \index.ls
  .pipe gulp-livescript!
  .pipe gulp.dest \.

gulp.task \default [\build]
