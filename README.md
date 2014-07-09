# VoiceText

A client library for Voice Text Web API.

https://cloud.voicetext.jp/webapi

## Installation

Clone this repository.

## Usage

```ruby
# coding: utf-8
require 'voice_text'
require 'fileutils'

api_key = ENV['VOICE_TEXT_API_KEY']
vt = VoiceText.new(api_key)
file = vt.text_to_speech('おはようございます')
FileUtils.move(file, "./voice.wav")

file = vt.text_to_speech('おはようございます', speaker: :hikari, emotion: :anger, pitch: 200)
FileUtils.move(file, "./voice_hikari_in_anger.wav")
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
