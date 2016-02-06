require! {
  'path'
  'vinyl': File
  'chai': {expect}
  'stream-assert-gulp': assert
  '../': gulp-asianbreak-html
}

It = global.it

describe 'Basic Usage' ->
  It 'complies normal HTML file into asianbreak-ed' (done) ->
    stream = gulp-asianbreak-html!

    stream.end new File {
      cwd: \/
      base: \/fixtures/
      path: \/fixtures/test.html
      contents: new Buffer '''
        <p>
          ほげ
          ふが
          ぴよ
        </p>
      '''
    }

    stream
    .pipe assert.length 1
    .pipe assert.first (file) ->
      expect file.is-stream! .to.be.false
      expect file.is-buffer! .to.be.true
      expect file.path .to.equal  \/fixtures/test.html
      expect file.contents.to-string! .to.equal '''
        <p>
          ほげふがぴよ
        </p>
      '''
    .on \end done
