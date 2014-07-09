# coding: utf-8

$LOAD_PATH.push('./lib')
require 'voice_text'
require 'fileutils'

api_key = ENV['VOICE_TEXT_API_KEY']

vt = VoiceText.new(api_key)

file = vt.download(text: 'おはようございます', speaker: 'hikari')

FileUtils.move(file, "./voice.wav")
