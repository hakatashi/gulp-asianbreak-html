# DEPRECATED

Use [vinyl-transform](https://www.npmjs.com/package/vinyl-transform) instead.

## Example

```js
const gulp = require('gulp');
const transform = require('vinyl-transform');
const asianbreak = require('asianbreak-html');

gulp.task('build', () => {
  return gulp.src('some.html')
    .pipe(transform(asianbreak))
    .pipe(gulp.dest('.'));

  // Or, with options
  return gulp.src('some.html')
    .pipe(transform(asianbreak.bind(null, {foo: 42})))
    .pipe(gulp.dest('.'));
});
```

# gulp-asianbreak-html

[![Build Status][travis-image]][travis-url]
[![NPM version][npm-image]][npm-url]
[![Dependency Status][gemnasium-image]][gemnasium-url]
[![Greenkeeper badge](https://badges.greenkeeper.io/hakatashi/gulp-asianbreak-html.svg)](https://greenkeeper.io/)

[travis-image]: https://travis-ci.org/hakatashi/gulp-asianbreak-html.svg?branch=master
[travis-url]: https://travis-ci.org/hakatashi/gulp-asianbreak-html
[npm-image]: https://badge.fury.io/js/gulp-asianbreak-html.svg
[npm-url]: https://www.npmjs.com/package/gulp-asianbreak-html
[gemnasium-image]: https://gemnasium.com/hakatashi/gulp-asianbreak-html.svg
[gemnasium-url]: https://gemnasium.com/hakatashi/gulp-asianbreak-html

Use [asianbreak-html][asianbreak-html] as Gulp plugin.

[asianbreak-html]: https://github.com/hakatashi/asianbreak-html

## Usage

```js
const gulp = require('gulp');
const asianbreak = require('gulp-asianbreak-html');

gulp.task('build', () => {
  return gulp.src('some.html')
    .pipe(asianbreak())
    .pipe(gulp.dest('.'));
});
```

## API

### `asianbreak([options])`

Create stream to convert [vinyl][vinyl] files into asianbreak-ed.

[vinyl]: https://github.com/gulpjs/vinyl

* option: simply passed to the original [asianbreak-html][asianbreak-html]
