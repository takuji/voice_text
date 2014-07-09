# coding: utf-8

$LOAD_PATH.push('./lib')
require 'voice_text'
require 'fileutils'

FileUtils.mkdir('voices') unless File.exist?('voices')

api_key = ENV['VOICE_TEXT_API_KEY']
vt = VoiceText.new(api_key)

text = '我々は一人の英雄を失った。しかし、これは敗北を意味するのか？否！始まりなのだ！ '
file = vt.text_to_speech(text, speaker: :hikari, emotion: :happiness, pitch: 100, speed: 200)
FileUtils.move(file, "./voices/00.wav")
