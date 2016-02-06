require! {
  'through2': through
  'xtend': extend
  'asianbreak-html': Asianbreak
  'concat-stream'
}

module.exports = (options) ->
  options = extend {} options

  return through.obj (file, encoding, done) ->
    asianbreak = new Asianbreak options

    if file.is-null!
      done null file

    else if file.is-buffer!
      asianbreak.pipe concat-stream {encoding: \buffer} (data) ->
        file.contents = data
        done null file

      asianbreak.on \error done

      asianbreak.end file.contents

    else if file.is-stream!
      file.contents = file.contents.pipe asianbreak
      done null file

    else
      done null file
