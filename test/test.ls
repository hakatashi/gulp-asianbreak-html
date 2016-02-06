require! {
  'fs'
  'path'
  'concat-stream'
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
      expect file.is-buffer! .to.be.true
      expect file.path .to.equal  \/fixtures/test.html
      expect file.contents.to-string! .to.equal '''
        <p>
          ほげふがぴよ
        </p>
      '''
    .on \end done

  It 'correctly handles stream file' (done) ->
    stream = gulp-asianbreak-html!

    stream.end new File {
      cwd: \/
      base: \/fixtures/
      path: \/fixtures/stream.html
      contents: fs.create-read-stream path.join __dirname, \fixtures/stream.html
    }

    stream
    .pipe assert.length 1
    .pipe assert.first (file) ->
      expect file.is-stream! .to.be.true
      expect file.path .to.equal  \/fixtures/stream.html
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
