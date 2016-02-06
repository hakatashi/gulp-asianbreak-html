require! {
  'through2': through
  'xtend': extend
  'asianbreak-html': Asianbreak
  'concat-stream'
}

module.exports = (options) ->
  options = extend {} options
  asianbreak = new Asianbreak options

  return through.obj (file, encoding, done) ->
    if file.is-null!
      done null file

    else if file.is-buffer!
      asianbreak.pipe concat-stream {encoding: \string} (data) ->
        file.contents = data
        done null file

      asianbreak.on \error done

      asianbreak.end file

    else if file.is-stream!
      file.contents = file.contents.pipe asianbreak
      done null file

    else
      done null file
