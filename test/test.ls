require! {
  'fs'
  'path'
  'gulp'
  'concat-stream'
  'vinyl': File
  'chai': {expect}
  'stream-assert-gulp': assert
  '../': gulp-asianbreak-html
}

It = global.it

describe 'Basic Usage' ->
  It 'complies normal HTML file into asianbreak-ed' (done) ->
    gulp.src path.join(__dirname, \fixtures/test.html)
    .pipe gulp-asianbreak-html!
    .pipe assert.length 1
    .pipe assert.first (file) ->
      expect file.is-buffer! .to.be.true
      expect file.path .to.equal path.join __dirname, \fixtures/test.html
      expect file.contents.to-string! .to.equal '''
        <p>
          ほげふがぴよ
        </p>
      '''
    .on \end done

  It 'correctly handles stream file' (done) ->
    gulp.src path.join(__dirname, \fixtures/test.html), {-buffer}
    .pipe gulp-asianbreak-html!
    .pipe assert.length 1
    .pipe assert.first (file) ->
      expect file.is-stream! .to.be.true
      file.contents.pipe concat-stream {encoding: \string} (data) ->
        expect data .to.equal '''
          <p>
            ほげふがぴよ
          </p>
        '''
        done!

  It 'ignores null file' (done) ->
    stream = gulp-asianbreak-html!

    stream.end new File {
      contents: null
    }

    stream
    .pipe assert.length 1
    .pipe assert.first (file) ->
      expect file.is-null! .to.be.true
    .on \end done
