'use strict';

// Developer: Maik Ellerbrock
// Github: https://github.com/ellerbrock
// Twitter: https://twitter.com/frapsoft

const gulp = require('gulp');
const sass = require('gulp-sass');

const sassFiles = process.env.SASS || '**/*.+(sass|scss)';
const config = {
  'sass': '/site/sass/' + sassFiles,
  'css': '/site/css'
};

if( process.env.GULP_DEBUG ) {
  console.log(`SASS: ${config.sass}`)
  console.log(`CSS: ${config.css}`)
}

const runSass = function() {
  return gulp.src(config.sass)
    .pipe(sass().on('error', sass.logError))
    .pipe(gulp.dest(config.css));
}

gulp.task('sass', function () {
  return runSass();
});

gulp.task('sass:watch', function () {
  gulp.watch(config.sass).on('change', function(event){
    return runSass();
  });
});

gulp.task('default', gulp.parallel( 'sass', 'sass:watch' ));
